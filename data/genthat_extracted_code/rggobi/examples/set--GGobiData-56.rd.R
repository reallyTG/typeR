library(rggobi)


### Name: "[<-.GGobiData"
### Title: Assignments for ggobi datasets
### Aliases: [<-.GGobiData $<-.GGobiData [[<-.GGobiData
### Keywords: manip internal

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
x <- g["mtcars"]
x[1:5, 1:5]
x[1:5, 1] <- 1:5
x[1:5, 1:5]}


