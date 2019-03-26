library(spc4sts)


### Name: pexptailecdf
### Title: Predictions from an Exptailecdf Object
### Aliases: pexptailecdf

### ** Examples

r <- rnorm(1000)
Fr <- exptailecdf(r)

pexptailecdf(Fr, max(r) + .1)
pexptailecdf(Fr, c(min(r) - .1, max(r) + .1))
pexptailecdf(Fr, matrix(c(.8, .9, 1, 1.1), 2, 2))



