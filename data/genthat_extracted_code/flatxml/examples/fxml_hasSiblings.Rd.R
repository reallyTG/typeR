library(flatxml)


### Name: fxml_hasSiblings
### Title: Siblings of an XML element
### Aliases: fxml_hasSiblings

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Check if XML element with ID 4 (xml.dataframe$elemid. ==  4) has any siblings
# (elements on the same hierarchy level)
fxml_hasSiblings(xml.dataframe, 4)



