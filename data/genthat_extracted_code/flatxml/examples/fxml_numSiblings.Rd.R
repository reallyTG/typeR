library(flatxml)


### Name: fxml_numSiblings
### Title: Siblings of an XML element
### Aliases: fxml_numSiblings

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Determine the number of siblings (elements on the same hierarchy level) of the XML element
# with ID 4 (xml.dataframe$elemid. ==  4)
fxml_numSiblings(xml.dataframe, 4)



