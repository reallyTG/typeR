library(flatxml)


### Name: fxml_numAttributes
### Title: Attributes of XML elements
### Aliases: fxml_numAttributes

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Determine the number of attributes of the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_numAttributes(xml.dataframe, 4)




