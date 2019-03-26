library(collapsibleTree)


### Name: collapsibleTreeNetwork
### Title: Create Network Interactive Collapsible Tree Diagrams
### Aliases: collapsibleTreeNetwork

### ** Examples

# Create a simple org chart
org <- data.frame(
  Manager = c(
    NA, "Ana", "Ana", "Bill", "Bill", "Bill", "Claudette", "Claudette", "Danny",
    "Fred", "Fred", "Grace", "Larry", "Larry", "Nicholas", "Nicholas"
  ),
  Employee = c(
    "Ana", "Bill", "Larry", "Claudette", "Danny", "Erika", "Fred", "Grace",
    "Henri", "Ida", "Joaquin", "Kate", "Mindy", "Nicholas", "Odette", "Peter"
  ),
  Title = c(
    "President", "VP Operations", "VP Finance", "Director", "Director", "Scientist",
    "Manager", "Manager", "Jr Scientist", "Operator", "Operator", "Associate",
     "Analyst", "Director", "Accountant", "Accountant"
  )
)
collapsibleTreeNetwork(org, attribute = "Title")

# Add in colors and sizes
org$Color <- org$Title
levels(org$Color) <- colorspace::rainbow_hcl(11)
collapsibleTreeNetwork(
  org,
  attribute = "Title",
  fill = "Color",
  nodeSize = "leafCount",
  collapsed = FALSE
)

# Use unsplash api to add in random photos to tooltip
org$tooltip <- paste0(
  org$Employee,
  "<br>Title: ",
  org$Title,
  "<br><img src='https://source.unsplash.com/collection/385548/150x100'>"
)

collapsibleTreeNetwork(
  org,
  attribute = "Title",
  fill = "Color",
  nodeSize = "leafCount",
  tooltipHtml = "tooltip",
  collapsed = FALSE
)




