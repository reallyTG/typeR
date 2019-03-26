library(irr)


### Name: iota
### Title: iota coefficient for the interrater agreement of multivariate
###   observations
### Aliases: iota
### Keywords: univar

### ** Examples

data(diagnoses)
iota(list(diagnoses))  # produces the same result as...
kappam.fleiss(diagnoses, exact=TRUE)

# Example from Janson & Olsson (2001), Table 1
photo <- list()
photo[[1]] <- cbind(c( 71, 73, 86, 59, 71),  # weight ratings
                    c( 74, 80,101, 62, 83),
                    c( 76, 80, 93, 66, 77))
photo[[2]] <- cbind(c(166,160,187,161,172),  # height rating
                    c(171,170,174,163,182),
                    c(171,165,185,162,181))
iota(photo)
iota(photo, standardize=TRUE) # iota over standardized values



