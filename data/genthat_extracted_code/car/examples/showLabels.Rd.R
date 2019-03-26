library(car)


### Name: showLabels
### Title: Functions to Identify and Mark Extreme Points in a 2D Plot.
### Aliases: showLabels
### Keywords: utilities

### ** Examples

plot(income ~ education, Prestige)
with(Prestige, showLabels(education, income,
     labels = rownames(Prestige), method=list("x", "y"), n=3))
m <- lm(income ~ education, Prestige)
plot(income ~ education, Prestige)
abline(m)
with(Prestige, showLabels(education, income,
     labels=rownames(Prestige), method=abs(residuals(m)), n=4))



