library(car)


### Name: crPlots
### Title: Component+Residual (Partial Residual) Plots
### Aliases: crPlots crp crPlot crPlot.lm
### Keywords: hplot regression

### ** Examples

crPlots(m<-lm(prestige ~ income + education, data=Prestige)) 

crPlots(m, terms=~ . - education) # get only one plot

crPlots(lm(prestige ~ log2(income) + education + poly(women,2), data=Prestige))

crPlots(glm(partic != "not.work" ~ hincome + children, 
  data=Womenlf, family=binomial), smooth=list(span=0.75))



