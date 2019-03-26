library(marelac)


### Name: Constants
### Title: Useful Physical and Chemical Constants
### Aliases: Constants
### Keywords: datasets

### ** Examples


data.frame(cbind(acronym = names(Constants),
           matrix(ncol = 3, byrow = TRUE, data = unlist(Constants),
           dimnames = list(NULL, c("value", "units", "description")))))



