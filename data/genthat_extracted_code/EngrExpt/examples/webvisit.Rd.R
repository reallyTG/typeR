library(EngrExpt)


### Name: webvisit
### Title: Web site visits over a 3-week period
### Aliases: webvisit
### Keywords: datasets

### ** Examples

str(webvisit)
densityplot(~ visits, webvisit,
            xlab = "Web site visits in a 3-week period")
qqmath(~ visits, webvisit, aspect = 1, type = c("g","p"),
       ylab = "Web site visits in a 3-week period",
       xlab = "Standard normal quantiles")
with(webvisit, summary(visits))



