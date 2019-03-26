library(AHMbook)


### Name: SwissSquirrels
### Title: Data for red squirrels in Switzerland
### Aliases: SwissSquirrels
### Keywords: datasets

### ** Examples

# To read in the text file:
fn <- file.path(find.package("AHMbook"), "extdata", "SwissSquirrels.txt")
data <- read.table(fn, header = TRUE)
str(data)




