library(TSP)


### Name: TOUR
### Title: Class TOUR - Solution to a traveling salesperson problem
### Aliases: TOUR print.TOUR as.TOUR as.TOUR.integer
### Keywords: classes

### ** Examples

TOUR(1:10)

## calculate a tour
data("USCA50")
tour <- solve_TSP(USCA50)
tour

## get permutation vector
as.integer(tour)

## get tour length directly from tour
attr(tour, "tour_length")
  
## show labels
labels(tour)



