library(animation)


### Name: pageview
### Title: Page views from Sep 21, 2007 to Dec 2, 2007 of Yihui's website
### Aliases: pageview

### ** Examples

plot(pageview[, 1:2], type = "b", col = "red", main = "Number of Visits in Yihui's Web")
## partial auto-correlation
pacf(pageview$visits)



