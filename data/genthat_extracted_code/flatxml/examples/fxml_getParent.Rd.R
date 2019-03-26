library(flatxml)


### Name: fxml_getParent
### Title: Parent of an XML element
### Aliases: fxml_getParent

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get the ID of the parent element of the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_getParent(xml.dataframe, 4)



