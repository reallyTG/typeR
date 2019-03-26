library(flatxml)


### Name: fxml_numChildren
### Title: Children of an XML element
### Aliases: fxml_numChildren

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Determine the number of children (sub-elements) of the XML element with ID 4
# (xml.dataframe$elemid. ==  4)
fxml_numChildren(xml.dataframe, 4)



