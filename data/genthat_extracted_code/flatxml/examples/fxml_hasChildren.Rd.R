library(flatxml)


### Name: fxml_hasChildren
### Title: Children of an XML element
### Aliases: fxml_hasChildren

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Check, if the XML element with ID 4 (xml.dataframe$elemid. ==  4) has any
# children (sub-elements)
fxml_hasChildren(xml.dataframe, 4)



