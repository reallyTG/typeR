library(networkD3)


### Name: diagonalNetwork
### Title: Create Reingold-Tilford Tree network diagrams.
### Aliases: diagonalNetwork

### ** Examples

## Not run: 
##D #### Create tree from JSON formatted data
##D ## Download JSON data
##D # Create URL. paste0 used purely to keep within line width.
##D URL <- paste0("https://cdn.rawgit.com/christophergandrud/networkD3/",
##D               "master/JSONdata//flare.json")
##D               
##D ## Convert to list format
##D Flare <- jsonlite::fromJSON(URL, simplifyDataFrame = FALSE)
##D 
##D ## Recreate Bostock example from http://bl.ocks.org/mbostock/4063550
##D diagonalNetwork(List = Flare, fontSize = 10, opacity = 0.9)
##D 
##D #### Create a tree dendrogram from an R hclust object
##D hc <- hclust(dist(USArrests), "ave")
##D diagonalNetwork(as.radialNetwork(hc))
##D diagonalNetwork(as.radialNetwork(hc), fontFamily = "cursive")
##D 
##D #### Create tree from a hierarchical R list
##D For an alternative structure see: http://stackoverflow.com/a/30747323/1705044
##D CanadaPC <- list(name = "Canada", children = list(list(name = "Newfoundland",
##D                     children = list(list(name = "St. John's"))),
##D                list(name = "PEI",
##D                     children = list(list(name = "Charlottetown"))),
##D                list(name = "Nova Scotia",
##D                     children = list(list(name = "Halifax"))),
##D                list(name = "New Brunswick",
##D                     children = list(list(name = "Fredericton"))),
##D                list(name = "Quebec",
##D                     children = list(list(name = "Montreal"),
##D                                     list(name = "Quebec City"))),
##D                list(name = "Ontario",
##D                     children = list(list(name = "Toronto"),
##D                                     list(name = "Ottawa"))),
##D                list(name = "Manitoba",
##D                     children = list(list(name = "Winnipeg"))),
##D                list(name = "Saskatchewan",
##D                     children = list(list(name = "Regina"))),
##D                list(name = "Nunavuet",
##D                     children = list(list(name = "Iqaluit"))),
##D                list(name = "NWT",
##D                     children = list(list(name = "Yellowknife"))),
##D                list(name = "Alberta",
##D                     children = list(list(name = "Edmonton"))),
##D                list(name = "British Columbia",
##D                     children = list(list(name = "Victoria"),
##D                                     list(name = "Vancouver"))),
##D                list(name = "Yukon",
##D                     children = list(list(name = "Whitehorse")))
##D ))
##D 
##D diagonalNetwork(List = CanadaPC, fontSize = 10)
## End(Not run)




