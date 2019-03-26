library(TropFishR)


### Name: plot.recruitment
### Title: Plot of recruitment patterns
### Aliases: plot.recruitment

### ** Examples

dat <- list(midLengths = seq(2,98,4),
               catch = c(0.6,17.6,93,83.2,12.6,0.3,0,0,0,1,17.1,51.4,
               26.1,2.2,0.2,4.5,21.6,17.6,3.7,8.7,10.6,6.3,5.6,2.9,0.8),
               Linf = 100,
               K = 0.5)
output <- recruitment(param = dat, tsample = 0.25)
plot(output, percent = FALSE)




