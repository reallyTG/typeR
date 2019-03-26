library(HH)


### Name: regrresidplot
### Title: Draw a plot of y vs x from a linear model object, with residuals
###   indicated by lines or squares.
### Aliases: regrresidplot panel.residSquare
### Keywords: hplot

### ** Examples

data(fat)
fat.lm <- lm(bodyfat ~ abdomin, data=fat)

AA <- regrresidplot(fat$abdomin, fat$bodyfat, xlim=c(70,185), ylim=c(0,50))
BB <- regrresidplot(fat$abdomin, fat$bodyfat, xlim=c(70,185), ylim=c(0,50),
                    resid.plot="line")
CC <- regrresidplot(fat$abdomin, fat$bodyfat, xlim=c(70,185), ylim=c(0,50),
                    resid.plot="square")

update(between=list(y=1),
       c("Residuals Not Displayed"=AA,
         "Residual Lines"=BB,
         "Residual Squares"=CC, layout=c(1,3)))



