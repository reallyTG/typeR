library(crunchy)


### Name: crunchPage
### Title: Build a Crunchy UI
### Aliases: crunchPage crunchFluidPage crunchFillPage

### ** Examples

## Not run: 
##D crunchPage(
##D     fluidRow(
##D         column(6,
##D             selectInput("filter",
##D                 label="Filter",
##D                 choices=filterList,
##D                 selected="All"),
##D             br(),
##D             plotOutput("funnel1", height="300"),
##D         ),
##D         column(6,
##D             selectInput("brand",
##D                 label="Competitor",
##D                 choices=brands,
##D                 selected="Nike"),
##D             br(),
##D             plotOutput("funnel2", height="300"),
##D         )
##D     )
##D )
## End(Not run)



