library(revtools)


### Name: screen_topics
### Title: Shiny app for screening bibliographies using topic models
### Aliases: screen_topics start_review_window

### ** Examples

# to run the app and upload data interactively
## Not run: screen_topics()
# or to specify data from the workspace
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)
# to run the app using these data:
## Not run: screen_topics(x)
# or to run the app & save results to the workspace:
## Not run: result <- screen_topics(x)



