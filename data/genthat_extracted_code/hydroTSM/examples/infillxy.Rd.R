library(hydroTSM)


### Name: infillxy
### Title: Infills NA values
### Aliases: infillxy infillxy.matrix infillxy.default infillxy.data.frame
### Keywords: manip

### ** Examples

obs <- c(1, NA, 3, 4, NA, 5)
sim <- rep(2, 6)

## Filling in the missing values in 'x' with the corresponding values in 'sim'
infillxy(x=obs, sim)




