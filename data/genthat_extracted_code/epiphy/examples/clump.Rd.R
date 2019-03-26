library(epiphy)


### Name: clump
### Title: Regroup observational data into even clumps of individuals.
### Aliases: clump clump.intensity

### ** Examples

my_incidence <- incidence(tomato_tswv$field_1929)
plot(my_incidence, type = "all")

# Different spatial size units:
my_incidence_clumped_1 <- clump(my_incidence, unit_size = c(x = 3, y = 3))
plot(my_incidence_clumped_1, type = "all")

my_incidence_clumped_2 <- clump(my_incidence, unit_size = c(x = 4, y = 5))
plot(my_incidence_clumped_2, type = "all")

# To get mean disease incidence for each plant over the 3 scoring dates:
my_incidence_clumped_3 <- clump(my_incidence, unit_size = c(t = 3), fun = mean)
plot(my_incidence_clumped_3)





