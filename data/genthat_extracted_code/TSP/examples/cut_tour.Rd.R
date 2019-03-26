library(TSP)


### Name: cut_tour
### Title: Cut a tour to form a path
### Aliases: cut_tour cut_tour.TOUR
### Keywords: optimize

### ** Examples

data("USCA50")

tsp <- insert_dummy(USCA50, label = "cut")
tour <- solve_TSP(tsp)

## cut tour into path at the dummy city
path <- cut_tour(tour, "cut")

labels(path)



