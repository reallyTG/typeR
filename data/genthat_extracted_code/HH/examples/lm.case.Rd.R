library(HH)


### Name: lm.case
### Title: case statistics for regression analysis
### Aliases: case case.lm plot.case panel.case
### Keywords: hplot regression

### ** Examples

data(kidney)

kidney2.lm <- lm(clearance ~ concent + age + weight + concent*age,
                 data=kidney,
                 na.action=na.exclude)  ## recommended

kidney2.case <- case(kidney2.lm)

## this picture looks much better in portrait, specification is device dependent

plot(kidney2.case, kidney2.lm, par.strip.text=list(cex=.9),
     layout=c(2,3))



