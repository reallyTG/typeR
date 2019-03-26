library(ggmuller)


### Name: add_start_points
### Title: Add rows to a population dataframe to ensure genotype starting
###   points are plotted correctly
### Aliases: add_start_points

### ** Examples

pop1 <- data.frame(Generation = rep(1:5, each = 4), Identity = rep(1:4, 5), 
                   Population = c(1,0,0,0,1,1,0,0,1,1,1,0,1,1,1,1,1,1,1,1))
add_start_points(pop1)

# to see the effect of changing start_positions, compare the Generation columns:
add_start_points(pop1, 0)
add_start_points(pop1, 1)




