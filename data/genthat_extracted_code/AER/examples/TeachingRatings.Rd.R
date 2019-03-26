library(AER)


### Name: TeachingRatings
### Title: Impact of Beauty on Instructor's Teaching Ratings
### Aliases: TeachingRatings
### Keywords: datasets

### ** Examples

data("TeachingRatings", package = "AER")

## evaluation score vs. beauty
plot(eval ~ beauty, data = TeachingRatings)
fm <- lm(eval ~ beauty, data = TeachingRatings)
abline(fm)
summary(fm)

## prediction of Stock & Watson's evaluation score
sw <- with(TeachingRatings, mean(beauty) + c(0, 1) * sd(beauty))
names(sw) <- c("Watson", "Stock")
predict(fm, newdata = data.frame(beauty = sw))

## Hamermesh and Parker, 2005, Table 3
fmw <- lm(eval ~ beauty + gender + minority + native + tenure + division + credits,
  weights = students, data = TeachingRatings)
coeftest(fmw, vcov = vcovCL, cluster = TeachingRatings$prof)



