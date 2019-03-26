library(flatxml)


### Name: fxml_getElementInfo
### Title: Handling flat XML files
### Aliases: fxml_getElementInfo

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get all relevant information on the XML element with ID 4 (xml.dataframe$elemid. ==  4)
fxml_getElementInfo(xml.dataframe, 4)



