library(flatxml)


### Name: fxml_findPath
### Title: Finding XML elements
### Aliases: fxml_findPath

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Find all XML elements with <data><record><field> in their XML path
path <- c("data", "record", "field")
fxml_findPath(xml.dataframe, path)

# Find only those XML elements with <data><record><field> in their XML path that have the
# "name" attribute of the <field> element set to "Sex"
path <- c("data", "record", "field")
fxml_findPath(xml.dataframe, path, attr.only = list(field = c(name = "Sex")))



