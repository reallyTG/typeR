library(lcc)


### Name: hue
### Title: Hue color data
### Aliases: hue
### Keywords: datasets

### ** Examples

data(hue)
summary(hue)
str(hue)
## Second degree polynomial model with random intercept, slope and
## quadratic term including an exponential variance function using
## time as covariate.
model<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
          method = "Method", time = "Time", qf = 2, qr = 2,
          components = TRUE, time_lcc = list(from = min(hue$Time),
          to = max(hue$Time), n=40), var.class=varExp,
          weights.form="time")
summary(model, type="model")
summary(model, type="lcc")
## for discussion on the analysis of complete data set,
## see Oliveira et al. (2018)



