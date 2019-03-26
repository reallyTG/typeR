library(LSD)


### Name: heatboxplot
### Title: Heatboxplot: a colored boxplot
### Aliases: LSD.heatboxplot heatboxplot
### Keywords: boxplot

### ** Examples

f = c(rnorm(200),rnorm(200)+4)
h = rf(500,15,15)*10
g = rnorm(300)+1

heatboxplot(h)

heatboxplot(list(f=f,g=g),colpals=c("rdpu","greens"),labels=c("bimodal","unimodal"))



