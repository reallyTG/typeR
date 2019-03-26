library(PKPDmisc)


### Name: view_creator
### Title: create view commands that save rds files to where a shiny app is
###   listening for them
### Aliases: view_creator

### ** Examples

## Not run: 
##D path <- "~/Repos/dataView" # dataView shiny app location
##D view2 <- view_creator(path)
##D View2(Theoph) # will save a file Theoph.rds in dataView
##D View2(Theoph, "theoph1") #will save a file theoph1.rds
##D View2(Theoph, return = F) # will not return Theoph as well
## End(Not run)



