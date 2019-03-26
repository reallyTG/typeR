library(marelac)


### Name: Oceans
### Title: Useful Characteristics of the Oceans
### Aliases: Oceans
### Keywords: datasets

### ** Examples


data.frame(cbind(acronym = names(Oceans),
           matrix(ncol = 3, byrow = TRUE, data = unlist(Oceans),
           dimnames = list(NULL, c("value", "units", "description")))))



