library(joineR)


### Name: UniqueVariables
### Title: Extracts the unique non-time dependent variables per patient,
###   from an unbalanced data set
### Aliases: UniqueVariables
### Keywords: data manip

### ** Examples

data(heart.valve)
heart.cov <- UniqueVariables(heart.valve,
                             c(2, 3, 5, 6, 12:25),
                             id.col = "num")



