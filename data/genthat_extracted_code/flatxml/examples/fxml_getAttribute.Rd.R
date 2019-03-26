library(flatxml)


### Name: fxml_getAttribute
### Title: Attributes of an XML element
### Aliases: fxml_getAttribute

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Read the value of attribute "name" from the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_getAttribute(xml.dataframe, 4, "name")



