library(d3Network)


### Name: d3Tree
### Title: Creates a D3 JavaScript Reingold-Tilford Tree network graph.
### Aliases: d3Tree

### ** Examples

## Create tree from R list
# Create hierarchical list
CanadaPC <- list(name = "Canada", children = list(list(name = "Newfoundland",
                    children = list(list(name = "St. John's"))),
               list(name = "PEI",
                    children = list(list(name = "Charlottetown"))),
               list(name = "Nova Scotia",
                    children = list(list(name = "Halifax"))),
               list(name = "New Brunswick",
                    children = list(list(name = "Fredericton"))),
               list(name = "Quebec",
                    children = list(list(name = "Montreal"),
                                    list(name = "Quebec City"))),
               list(name = "Ontario",
                    children = list(list(name = "Toronto"),
                                    list(name = "Ottawa"))),
               list(name = "Manitoba",
                    children = list(list(name = "Winnipeg"))),
               list(name = "Saskatchewan",
                    children = list(list(name = "Regina"))),
               list(name = "Nunavuet",
                    children = list(list(name = "Iqaluit"))),
               list(name = "NWT",
                    children = list(list(name = "Yellowknife"))),
               list(name = "Alberta",
                    children = list(list(name = "Edmonton"))),
               list(name = "British Columbia",
                    children = list(list(name = "Victoria"),
                                    list(name = "Vancouver"))),
               list(name = "Yukon",
                    children = list(list(name = "Whitehorse")))
))

# Create tree
d3Tree(List = CanadaPC, fontsize = 10, diameter = 500)

## Create tree from JSON formatted data
## dontrun
## Download JSON data
# library(RCurl)
# URL <- "https://raw.github.com/christophergandrud/d3Network/master/JSONdata/flare.json"
# Flare <- getURL(URL)

## Convert to list format
# Flare <- rjson::fromJSON(Flare)

## Recreate Bostock example from http://bl.ocks.org/mbostock/4063550
# d3Tree(List = Flare, file = "Flare.html",
#        fontsize = 10, opacity = 0.9, diameter = 1000)



