library(flatxml)


### Name: fxml_hasValue
### Title: Value of an XML element
### Aliases: fxml_hasValue

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Check if element with ID 4 (xml.dataframe$elemid. ==  4) carries a value
fxml_hasValue(xml.dataframe, 4)




