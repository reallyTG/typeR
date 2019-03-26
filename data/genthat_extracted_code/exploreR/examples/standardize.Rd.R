library(exploreR)


### Name: standardize
### Title: Standardize Variables
### Aliases: standardize

### ** Examples

exam.df <- iris
standardize(exam.df, "Petal.Width")
standardize(exam.df, c("Petal.Width", "Petal.Length"), type = "classic")



