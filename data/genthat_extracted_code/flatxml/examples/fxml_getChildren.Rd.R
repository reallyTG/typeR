library(flatxml)


### Name: fxml_getChildren
### Title: Children of an XML element
### Aliases: fxml_getChildren

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get all the children (sub-elements) of the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_hasChildren(xml.dataframe, 4)



