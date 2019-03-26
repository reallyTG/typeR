library(EDFIR)


### Name: estimate.shiftvec
### Title: estimate.shiftvec
### Aliases: estimate.shiftvec

### ** Examples

## normally input is read from a file via build.isotopeframe, but here
## we generate the input by hand
## we have three prey species: birds, mice, and bugs
## one predator species: cats
## we are measuring two isotopic values for each: %%C and %%N
## assume that all measurements are normally distributed
bird.samples <- as.data.frame(mvrnorm(n=25, mu=c(2, 2),
  Sigma=diag(c(1, 1), nrow=2)))
mice.samples <- as.data.frame(mvrnorm(n=25, mu=c(4, 4),
  Sigma=diag(c(1, 1), nrow=2)))
bugs.samples <- as.data.frame(mvrnorm(n=25, mu=c(2, 6),
  Sigma=diag(c(1, 1), nrow=2)))

## note that prey are collected into a single data frame, 
## as are the predators
## if number of samples differs from species to species,
## the data frame should be padded
## with NAs appropriately (this is done automatically when
## reading in from CSV)
pred.frame <- data.frame(cats=mvrnorm(n=20, mu=c(6, 6),
  Sigma=diag(c(1/2, 1/2), nrow=2)))
prey.frame = data.frame(bird=bird.samples, mice=mice.samples,
  bugs=bugs.samples)

## now estimate discrimination factors
## in applications, usually the prey measurements are given by mean/sd
## of corresponding gaussian, so we notify the function that we are
## actually providing samples in this example
estimate.shiftvec(pred.frame, prey.frame, num.samples=10,
  prey.distinput=FALSE) 



