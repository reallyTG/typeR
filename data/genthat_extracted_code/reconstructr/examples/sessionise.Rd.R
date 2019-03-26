library(reconstructr)


### Name: sessionise
### Title: Reconstruct sessions (experimental)
### Aliases: sessionise

### ** Examples

# Take a dataset with URLs and similar metadata and sessionise it -
# retaining that metadata

data("session_dataset")
sessionised_data <- sessionise(x = session_dataset,
                              timestamp = timestamp,
                              user_id = uuid,
                              threshold = 1800)




