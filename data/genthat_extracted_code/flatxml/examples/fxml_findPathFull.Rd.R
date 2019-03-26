library(flatxml)


### Name: fxml_findPathFull
### Title: Finding XML elements
### Aliases: fxml_findPathFull

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Find all XML elements that have the exact path <root><data><record>
path <- c("root", "data", "record")
fxml_findPathFull(xml.dataframe, path)



