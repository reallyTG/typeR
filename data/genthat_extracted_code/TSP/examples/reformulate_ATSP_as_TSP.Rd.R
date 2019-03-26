library(TSP)


### Name: reformulate_ATSP_as_TSP
### Title: Reformulate a ATSP as a symmetric TSP
### Aliases: reformulate_ATSP_as_TSP
### Keywords: optimize

### ** Examples

data("USCA50")

## set the distances towards Austin to zero which makes it a ATSP
austin <- which(labels(USCA50) == "Austin, TX")
atsp <- as.ATSP(USCA50)
atsp[, austin] <- 0

## reformulate as a TSP
tsp <- reformulate_ATSP_as_TSP(atsp)
labels(tsp)

## create tour (now you could use Concorde or LK)
tour_atsp <- solve_TSP(tsp, method="nn")
head(labels(tour_atsp), n = 10)
tour_atsp
## Note that the tour has a lenght of -Inf since the reformulation created
## some -Inf distances

## filter out the dummy cities (we specify tsp so the tour lenght is 
## recalculated)
tour <- TOUR(tour_atsp[tour_atsp <= n_of_cities(atsp)], tsp = atsp)
tour



