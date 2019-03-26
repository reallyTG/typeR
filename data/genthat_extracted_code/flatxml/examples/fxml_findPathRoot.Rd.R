library(flatxml)


### Name: fxml_findPathRoot
### Title: Finding XML elements
### Aliases: fxml_findPathRoot

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Find all XML elements that have a path starting with <root><data><record><field>
path <- c("root", "data", "record", "field")
fxml_findPathRoot(xml.dataframe, path)

# Find all XML elements that have a path starting with <root><data><record><field>, but only
# those which have the "name" attribute of the <field> element set to "Sex"
path <- c("root", "data", "record", "field")
fxml_findPathRoot(xml.dataframe, path, attr.only = list(field = c(name = "Sex")))



