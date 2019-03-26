library(flatxml)


### Name: fxml_toDataFrame
### Title: Extracting data from an XML document into a dataframe
### Aliases: fxml_toDataFrame

### ** Examples

# Load example file with population data from United Nations Statistics Division
# and create flat dataframe
example <- system.file("worldpopulation.xml", package="flatxml")
xml.dataframe <- fxml_importXMLFlat(example)

# Extract the data out of the XML document. The data records are on the same hierarchical level
# as element with ID 3 (xml.dataframe$elemid. ==  3).
# The field names are given in the "name" attribute of the children elements of element no. 3
# and its siblings
population.df <- fxml_toDataFrame(xml.dataframe, siblings.of=3, elem.or.attr="attr",
col.attr="name")
# Exclude the "Value Footnote" field from the returned dataframe
population.df <- fxml_toDataFrame(xml.dataframe, siblings.of=3, elem.or.attr="attr",
col.attr="name", exclude.fields=c("Value Footnote"))


# Load example file with soccer world cup data (data from
# https://www.fifa.com/fifa-tournaments/statistics-and-records/worldcup/index.html)
# and create flat dataframe
example2 <- system.file("soccer.xml", package="flatxml")
xml.dataframe2 <- fxml_importXMLFlat(example2)

# Extract the data out of the XML document. The data records are on the same hierarchical level
# as element with ID 3 (xml.dataframe$elemid. ==  3). #' # The field names are given as the name
# of the children elements of element no. 3 and its siblings.
worldcups.df <- fxml_toDataFrame(xml.dataframe2, siblings.of=3, elem.or.attr="elem")



