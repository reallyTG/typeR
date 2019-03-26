library(exploreR)


### Name: masslm
### Title: Mass Linear Regression
### Aliases: masslm

### ** Examples

exam.df <- iris
masslm(exam.df, "Sepal.Width", ignore = "Species")
masslm(exam.df, "Sepal.Width", ignore = c("Species", "Petal.Width"))



