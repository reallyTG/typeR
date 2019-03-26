library(flatxml)


### Name: fxml_importXMLFlat
### Title: Handling flat XML files
### Aliases: fxml_importXMLFlat

### ** Examples

# Load example file with population data from United Nations Statistics Division
example <- system.file("worldpopulation.xml", package="flatxml")
# Create flat dataframe from XML
xml.dataframe <- fxml_importXMLFlat(example)




