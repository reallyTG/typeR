library(etm)


### Name: etmprep
### Title: Data transformation function for using etm
### Aliases: etmprep
### Keywords: datagen manip

### ** Examples

### creation of fake data in the wild format, following an illness-death model
## transition times
tdisease <- c(3, 4, 3, 6, 8, 9)
tdeath <- c(6, 9, 8, 6, 8, 9)

## transition status
stat.disease <- c(1, 1, 1, 0, 0, 0)
stat.death <- c(1, 1, 1, 1, 1, 0)

## a covariate that we want to keep in the new data
cova <- rbinom(6, 1, 0.5)

dat <- data.frame(tdisease, tdeath,
                  stat.disease, stat.death,
                  cova)

## Possible transitions
tra <- matrix(FALSE, 3, 3)
tra[1, 2:3] <- TRUE
tra[2, 3] <- TRUE

## data preparation
newdat <- etmprep(c(NA, "tdisease", "tdeath"),
                  c(NA, "stat.disease", "stat.death"),
                  data = dat, tra = tra, cens.name = "cens")



