library(coefplot)


### Name: coefplot.rxGlm
### Title: coefplot.rxGlm
### Aliases: coefplot.rxGlm

### ** Examples


## Not run: 
##D mod4 <- rxGlm(price ~ carat + cut + x, data=diamonds)
##D mod5 <- rxGlm(price > 10000 ~ carat + cut + x, data=diamonds, family="binomial")
##D coefplot(mod4)
##D coefplot(mod5)
## End(Not run)




