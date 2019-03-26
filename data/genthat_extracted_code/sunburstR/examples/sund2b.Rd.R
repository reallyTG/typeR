library(sunburstR)


### Name: sund2b
### Title: Sunburst Using 'd2b'
### Aliases: sund2b

### ** Examples

## Not run: 
##D 
##D # The sund2b() API mirrors sunburst() with fewer arguments.
##D 
##D library(sunburstR)
##D 
##D # use a sample of the sequences csv data
##D sequences <- read.csv(
##D   system.file("examples/visit-sequences.csv",package="sunburstR")
##D   ,header = FALSE
##D   ,stringsAsFactors = FALSE
##D )[1:200,]
##D 
##D # create a d2b sunburst
##D sund2b(sequences)
##D 
##D # change the colors
##D #   using d3.js categorical color scheme
##D sund2b(
##D   sequences,
##D   colors = htmlwidgets::JS("d3.scaleOrdinal(d3.schemeCategory20b)")
##D )
##D #  using RColorBrewer palette
##D sund2b(
##D   sequences,
##D   colors = list(range = RColorBrewer::brewer.pal(9, "Set3"))
##D )
##D #  using a color column from the R dataset
##D #  treemap has an amazing treecolors ability
##D library(treemap)
##D library(d3r)
##D rhd <- random.hierarchical.data()
##D tm <- treemap(
##D   rhd,
##D   index = paste0("index", 1:3),
##D   vSize = "x",
##D   draw = FALSE
##D )$tm
##D sund2b(
##D   d3_nest(tm, value_cols = colnames(tm)[-(1:3)]),
##D   colors = htmlwidgets::JS(
##D     # yes this is a little different, so please pay attention
##D     #  "function(d) {return d.color}" will not work
##D     "function(name, d){return d.color || '#ccc';}"
##D   ),
##D   valueField = "vSize"
##D )
##D 
##D 
##D # use sund2b in Shiny
##D library(shiny)
##D ui <- sund2bOutput("sun")
##D server <- function(input, output, session) {
##D   output$sun <- renderSund2b({
##D     sund2b(sequences)
##D   })
##D }
##D shinyApp(ui, server)
##D 
## End(Not run)



