library(GDAtools)


### Name: pem
### Title: Computes the local and global Percentages of Maximum Deviation
###   from Independance (PEM)
### Aliases: pem
### Keywords: multivariate misc

### ** Examples

## Computes the PEM for the contingency table
## of jazz and age variables
## from the 'Music' example data set
data(Music)
x <- table(Music$Jazz,Music$Age)
pem(x)



