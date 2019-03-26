library(selectapref)


### Name: manlysalpha
### Title: Manly's alpha feeding preference (Chesson 1968). Returns
###   Manly'as alpha index from vectors of initial and final food item
###   counts.
### Aliases: manlysalpha
### Keywords: Manly's alpha preference selectivity

### ** Examples

initial_prey_count <- c(10,10,10,10,10,10)
number_prey_consumed <- c(9,8,1,3,5,9)
manlysalpha(initial = initial_prey_count, consumed = number_prey_consumed,
stand = TRUE, perc = FALSE, deplete = TRUE)

manlysalpha(initial = initial_prey_count, consumed = number_prey_consumed,
stand = TRUE, perc = TRUE, deplete = TRUE)




