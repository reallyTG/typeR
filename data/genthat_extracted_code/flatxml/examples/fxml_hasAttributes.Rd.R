library(flatxml)


### Name: fxml_hasAttributes
### Title: Attributes of XML elements
### Aliases: fxml_hasAttributes

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Check if the XML element with ID 4 (xml.dataframe$elemid. ==  4) has any attributes
fxml_hasAttributes(xml.dataframe, 4)




