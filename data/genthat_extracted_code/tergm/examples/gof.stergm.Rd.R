library(tergm)


### Name: gof.stergm
### Title: Goodness-of-fit methods for STERGM CMLE and CMPLE fits
### Aliases: gof.stergm print.gof.stergm summary.gof.stergm plot.gof.stergm
### Keywords: models

### ** Examples


## No test: 
data(samplk)

# Fit a transition from Time 1 to Time 2
samplk12 <- stergm(list(samplk1, samplk2),
                   formation=~edges+mutual+transitiveties+cyclicalties,
                   dissolution=~edges+mutual+transitiveties+cyclicalties,
                   estimate="CMLE")

samplk12.gof <- gof(samplk12)

samplk12.gof

summary(samplk12.gof)

plot(samplk12.gof)

plot(samplk12.gof, plotlogodds=TRUE)
## End(No test)




