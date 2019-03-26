library(EQUIVNONINF)


### Name: gofsimpt
### Title: Establishing goodness of fit of an observed to a fully specified
###   multinomial distribution: test statistic and critical bound
### Aliases: gofsimpt
### Keywords: one-dimensional contingency table fully specified multinomial
###   distribution model verification Euclidean distance statistic
###   asymptotic normality

### ** Examples

x<- c(17,16,25,9,16,17)
pio <- rep(1,6)/6
gofsimpt(0.05,100,6,0.15,x,pio)



