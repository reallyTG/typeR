library(TSP)


### Name: tour_length
### Title: Calculate the length of a tour
### Aliases: tour_length tour_length.TOUR tour_length.TSP tour_length.ATSP
###   tour_length.ETSP
### Keywords: optimize

### ** Examples

data("USCA50")

## original order
tour_length(solve_TSP(USCA50, method="identity"))

## length of a manually created (random) tour
tour <- TOUR(sample(seq(n_of_cities(USCA50))))
tour
tour_length(tour)
tour_length(tour, USCA50)



