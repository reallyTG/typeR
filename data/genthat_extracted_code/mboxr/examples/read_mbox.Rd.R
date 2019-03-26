library(mboxr)


### Name: read_mbox
### Title: Converting an mbox file into a tibble data_frame.
### Aliases: read_mbox
### Keywords: read_mbox

### ** Examples

## No test: 
# Changing working directory to temp for the demonstration purpose only.
setwd(tempdir())
library(mboxr)
# Feeding an mbox file through read_mbox function:
test <- system.file("extdata", "test1.mbox", package = "mboxr")
data <- read_mbox(test, out = "output.csv")
# Now you can use the imported file as a tibble.
str(data)
## End(No test)



