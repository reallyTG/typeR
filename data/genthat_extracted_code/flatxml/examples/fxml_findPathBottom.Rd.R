library(flatxml)


### Name: fxml_findPathBottom
### Title: Finding XML elements
### Aliases: fxml_findPathBottom

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Find all XML elements that have a path ending with <record><field>
path <- c("record", "field")
fxml_findPathBottom(xml.dataframe, path)

# Find all XML elements that have a path ending with <record><field>, but only
# those which have the "name" attribute of the <field> element set to "Sex"
path <- c("record", "field")
fxml_findPathBottom(xml.dataframe, path, attr.only = list(field = c(name = "Sex")))



