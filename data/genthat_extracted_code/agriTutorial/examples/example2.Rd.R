library(agriTutorial)


### Name: example2
### Title: Example 2: Lack-of-fit and marginality for a single quantitative
###   treatment factor
### Aliases: example2

### ** Examples


## *************************************************************************************
##                       How to run the code
## *************************************************************************************

## Either type example("example2") to run ALL the examples succesively
## or copy and paste examples sucessively, as required

## *************************************************************************************
##                         Options and required packages
## *************************************************************************************

options(contrasts = c('contr.treatment', 'contr.poly'))
## ggplot2 MUST be installed
require(ggplot2)

## *************************************************************************************
##         Polynomial analysis and graphical plots of factorial treatment effects
## *************************************************************************************

N = poly((beet$nrate/100), degree = 4, raw = TRUE)
colnames(N) = c("Linear_N", "Quadratic_N", "Cubic_N", "Quartic_N")
beet = cbind(beet, N)

## Tables 4 and 5: Full polynomial analysis of variance based on raw polynomials
anova(lm(yield ~ Replicate + Linear_N + Quadratic_N + Cubic_N + Quartic_N, data = beet))

##  Table 6: showing quadratic model coefficients with standard errors and confidence intervals
quadratic = lm(yield ~ Replicate + Linear_N + Quadratic_N, data = beet)
summary(quadratic)
confint(quadratic, level = 0.95)

par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(quadratic, sub.caption = NA)
title(main = "Diagnostic plots for quadratic nitrogen effects model", outer = TRUE)

ggplot(beet, aes(x = nrate, y = yield)) +
 ggtitle("Fig 3 Yield versus N for sugar beet with 95% confidence band") +
 geom_point(shape = 1) + stat_summary(fun.y = mean, geom = "point") +
 geom_smooth(method = lm, formula = y ~ poly(x, 2)) + theme_bw()




