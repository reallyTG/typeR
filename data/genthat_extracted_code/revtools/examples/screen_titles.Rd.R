library(revtools)


### Name: screen_titles
### Title: Shiny app for screening articles by their titles
### Aliases: screen_titles

### ** Examples

# to run the app and upload data interactively
## Not run: screen_titles()
# or to specify data from the workspace
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)
# to run the app using these data:
## Not run: screen_titles(x)
# or to run the app & save results to the workspace:
## Not run: result <- screen_titles(x)



