//   Copyright (c) 2012, John Evans
//
//   http://www.lucastudios.com/contact
//   John: https://plus.google.com/u/0/115427174005651655317/about
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.


/**
* Represents an element of an [XmlNode].
*/
class XmlElement extends XmlNode {
  final String tagName;

  XmlElement(this.tagName, [List<XmlNode> elements = const []])
  :
    super(XmlNodeType.Element, new List<XmlNode>())
  {
    addChildren(elements);
  }

  Collection<XmlNode> get attributes() => children.filter((el) => el is XmlAttribute);

  Collection<XmlNode> get elements() => children.filter((el) => el is! XmlAttribute);

  String get text() {
    var tNodes = children.filter((el) => el is XmlText);
    if (tNodes.isEmpty()) return '';

    var s = new StringBuffer();
    tNodes.forEach((n) => s.add(n.text));
    return s.toString();
  }

  void addChild(XmlNode element){
    if (element is XmlDocument){
      throw const Exception('XmlDocument cannot be a child of any other node.');
    }
    element.parent = this;
    children.add(element);
  }

  void addChildren(List<XmlNode> elements){
    if (!elements.isEmpty()){
      elements.forEach((XmlNode e) => addChild(e));
    }
  }

}





