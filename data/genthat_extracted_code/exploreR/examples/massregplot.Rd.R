library(exploreR)


### Name: massregplot
### Title: Mass Regression Plot
### Aliases: massregplot

### ** Examples

exam.df <- iris
massregplot(exam.df, "Sepal.Length", ignore = "Species")
massregplot(exam.df, "Sepal.Length", ignore = c("Species", "Petal.Width"), include.se = FALSE)




