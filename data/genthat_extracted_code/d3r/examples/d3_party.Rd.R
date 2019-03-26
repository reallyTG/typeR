library(d3r)


### Name: d3_party
### Title: Convert partykit to d3.js hierarchy
### Aliases: d3_party

### ** Examples

## Not run: 
##D 
##D   library(d3r)
##D   # from ?rpart
##D   data("kyphosis", package="rpart")
##D   d3_party(
##D     rpart::rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
##D   )
##D 
##D   # if you want the list instead of json
##D   d3_party(
##D     rpart::rpart(Kyphosis ~ Age + Number + Start, data = kyphosis),
##D     json = FALSE
##D   )
##D 
##D   # with ctree instead of rpart
##D   #  using example from ?ctree
##D   d3_party(partykit::ctree(Species ~ .,data = iris))
##D 
##D 
##D   #devtools::install_github("timelyportfolio/d3treeR")
##D 
##D   library(d3treeR)
##D 
##D   d3tree2(
##D     d3_party(
##D       rpart::rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)
##D     ),
##D     celltext = "rule",
##D     valueField = "n"
##D   )
##D 
## End(Not run)



