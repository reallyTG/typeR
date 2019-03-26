library(multiCA)


### Name: power.multiCA.test
### Title: Power calculations for the multinomial Cochran-Armitage trend
###   test
### Aliases: power.multiCA.test

### ** Examples

power.multiCA.test(power=0.8, p.start=c(0.1,0.2,0.3,0.4), p.end=c(0.4, 0.3, 0.2, 0.1), 
                     G=5, n.prop=c(3,2,1,2,3))

## Power of stroke study with 100 subjects per year and observed trends
data(stroke)
strk.mat <- xtabs(Freq ~ Type + Year, data=stroke)
power.multiCA.test(N=900, pmatrix=prop.table(strk.mat, margin=2))



