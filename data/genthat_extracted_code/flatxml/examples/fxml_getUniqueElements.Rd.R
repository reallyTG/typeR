library(flatxml)


### Name: fxml_getUniqueElements
### Title: Handling flat XML files
### Aliases: fxml_getUniqueElements

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Identify the unique XML elements
fxml_getUniqueElements(xml.dataframe)



