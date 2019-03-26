library(RJSplot)


### Name: circularfv_rjs
### Title: Pruduce a circular sequence viewer.
### Aliases: circularfv_rjs

### ** Examples

## Creates a circular sequence viewer in the folder "CircularFV" of your local machine
## Generate test input data
sequence <- paste(sample(c("c","a","t","g"), 10000, replace = TRUE), collapse = "")
data <- matrix(round(runif(12,0,10000)),6,2)
features <- data.frame(id = 0:5, start = data[,1], stop = data[,2],
type = c("voluptate","non","voluptate","sit","et","proident"),
color = c("SandyBrown","Tan","Wheat","SteelBlue","LightSkyBlue","LightBlue"))

## Create the circular sequence viewver
circularfv_rjs(sequence, features)



