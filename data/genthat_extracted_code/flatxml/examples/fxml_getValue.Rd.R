library(flatxml)


### Name: fxml_getValue
### Title: Value of an XML element
### Aliases: fxml_getValue

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get the value of the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_hasValue(xml.dataframe, 4)




