library(flatxml)


### Name: fxml_getAttributesAll
### Title: Attributes of an XML element
### Aliases: fxml_getAttributesAll

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get all attribute of the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_getAttributesAll(xml.dataframe, 4)



