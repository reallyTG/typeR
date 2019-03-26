library(simmer)


### Name: length.trajectory
### Title: Number of Activities in a Trajectory
### Aliases: length.trajectory get_n_activities

### ** Examples

x <- trajectory() %>%
  timeout(1)

x <- x %>%
  clone(2, x, x)
x

## length does not account for subtrajectories
length(x)
get_n_activities(x)




