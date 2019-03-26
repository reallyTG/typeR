library(dispRity)


### Name: adonis.dispRity
### Title: adonis dispRity (from 'vegan::adonis')
### Aliases: adonis.dispRity

### ** Examples

## Adonis with one groups 

## Generating a random character matrix
character_matrix <- sim.morpho(rtree(20), 50, rates = c(rnorm, 1, 0))
## Calculating the distance matrix
distance_matrix <- as.matrix(dist(character_matrix))
## Creating two groups
random_groups <- list("group1" = 1:10, "group2" = 11:20)

## Generating a dispRity object
random_disparity <- custom.subsets(distance_matrix, random_groups)
## Running a default NPMANOVA
adonis.dispRity(random_disparity)


## Adonis with multiple groups

## Creating a random matrix
random_matrix <- matrix(data = rnorm(90), nrow = 10, 
                     dimnames = list(letters[1:10]))
## Creating two groups with two states each
groups <- as.data.frame(matrix(data = c(rep(1,5), rep(2,5), rep(c(1,2), 5)),
         nrow = 10, ncol = 2, dimnames = list(letters[1:10], c("g1", "g2"))))

## Creating the dispRity object
multi_groups <- custom.subsets(random_matrix, groups)

## Running the NPMANOVA
adonis.dispRity(multi_groups, matrix ~ g1 + g2)

## Adonis with time

## Creating time series
data(BeckLee_mat50)
data(BeckLee_tree)
data(BeckLee_ages)
time_subsets <- chrono.subsets(BeckLee_mat50, BeckLee_tree, 
     method = "discrete", inc.nodes = FALSE, time = c(100, 85, 65, 0),
     FADLAD = BeckLee_ages)

## Running the NPMANOVA with time as a predictor
adonis.dispRity(time_subsets, matrix ~ time)

## Running the NPMANOVA with each time bin as a predictor
adonis.dispRity(time_subsets, matrix ~ chrono.subsets)




