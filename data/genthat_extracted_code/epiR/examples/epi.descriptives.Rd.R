library(epiR)


### Name: epi.descriptives
### Title: Descriptive statistics
### Aliases: epi.descriptives
### Keywords: univar univar

### ** Examples

id <- 1:1000
tmp <- rnorm(1000, mean = 0, sd = 1)
id <- sample(id, size = 20)
tmp[id] <- NA

epi.descriptives(tmp, conf.level = 0.95)



