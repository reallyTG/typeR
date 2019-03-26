library(HUM)


### Name: sim
### Title: desease data
### Aliases: sim
### Keywords: datasets

### ** Examples

# load the dataset
data(sim)
# CD15
with(sim, by(CD15,Disease,mean))

# CD20
with(sim,tapply(CD20, Disease, FUN = mean))
with(sim, table(CD20=ifelse(CD20<=mean(CD20), "1", "2"), Disease))



