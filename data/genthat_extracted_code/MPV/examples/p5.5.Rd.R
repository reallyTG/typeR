library(MPV)


### Name: p5.5
### Title: Data Set for Problem 5-5
### Aliases: p5.5
### Keywords: datasets

### ** Examples

data(p5.5)
defects.lm <- lm(defects~weeks, data=p5.5)
plot(defects.lm, which=1)



