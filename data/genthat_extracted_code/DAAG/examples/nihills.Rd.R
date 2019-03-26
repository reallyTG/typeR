library(DAAG)


### Name: nihills
### Title: Record times for Northern Ireland mountain running events
### Aliases: nihills
### Keywords: datasets

### ** Examples

data(nihills)
lm(formula = log(time) ~ log(dist) + log(climb), data = nihills)
lm(formula = log(time) ~ log(dist) + log(climb/dist), data = nihills)



