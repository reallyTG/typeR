library(flatxml)


### Name: fxml_getDepthLevel
### Title: Handling flat XML files
### Aliases: fxml_getDepthLevel

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Determine hierarchy level of XML element with ID 3 (xml.dataframe$elemid. ==  3)
fxml_getDepthLevel(xml.dataframe, 3)




