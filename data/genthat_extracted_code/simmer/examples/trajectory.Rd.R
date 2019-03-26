library(simmer)


### Name: trajectory
### Title: Create a Trajectory
### Aliases: trajectory

### ** Examples

## create an empty trajectory
x <- trajectory("my trajectory")
x

## add some activities by chaining them
x <- x %>%
  log_("here I am!") %>%
  timeout(5) %>%
  log_("leaving!")
x

## join trajectories
x <- join(x, x)

## extract and replace
x[c(3, 4)] <- x[2]
x




