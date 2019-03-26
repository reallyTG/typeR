library(mboxr)


### Name: merge_mbox_all
### Title: Merging all mbox files in current directory into one tibble.
### Aliases: merge_mbox_all
### Keywords: merge_mbox_all

### ** Examples

## No test: 
# Changing working directory to temp for the demonstration purpose only.
setwd(tempdir())
library(mboxr)
test_path <- system.file("extdata", package = "mboxr")
# Save your own csv file as an output if you need it:
data <- merge_mbox_all(path = test_path, out = "output.csv")
# Now you can use the imported file as a tibble.
str(data)
## End(No test)



