library(flatxml)


### Name: fxml_getElement
### Title: Handling flat XML files
### Aliases: fxml_getElement

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Get the XML element with ID 3 (xml.dataframe$elemid. ==  3)
fxml_getElement(xml.dataframe, 3)



