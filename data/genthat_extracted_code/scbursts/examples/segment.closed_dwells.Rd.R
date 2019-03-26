library(scbursts)


### Name: segment.closed_dwells
### Title: Extract closed dwells.
### Aliases: segment.closed_dwells

### ** Examples


# It's more likely that you created states or dwells with some function
states  <-  c(0,      1,    0,    1,    0,    1,    0,    1,    0,    1)
dwells  <-  c(0.1,  1.1,  0.5,  0.2,  1.0,  1.1,  0.6,  1.1,  0.8,  1.1)
my_burst <- segment.create(states, dwells, seg=1, start_time=3.14159, name="example_segment")

closed_dwells <- segment.closed_dwells(my_burst)
head(closed_dwells)




