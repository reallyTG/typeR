library(revtools)


### Name: screen_duplicates
### Title: Shiny app for locating and excluding duplicated entries in a
###   dataset
### Aliases: screen_duplicates

### ** Examples

# to run the app and upload data interactively
## Not run: screen_duplicates()
# or to specify data from the workspace
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)
# to run the app using these data:
## Not run: screen_duplicates(x)
# or to run the app & save results to the workspace:
## Not run: result <- screen_duplicates(x)



