library(SAMURAI)


### Name: funnelplot
### Title: Funnel Plot
### Aliases: funnelplot
### Keywords: funnel plot meta-analysis sensitivity analysis

### ** Examples

library(SAMURAI)

data(Hpylori)
funnelplot(Hpylori, binary=TRUE, higher.is.better=FALSE, 
  outlook="very negative")

data(greentea)
funnelplot(greentea, binary=FALSE, higher.is.better=FALSE)



