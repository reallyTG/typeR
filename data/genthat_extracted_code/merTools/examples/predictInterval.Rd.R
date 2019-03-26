library(merTools)


### Name: predictInterval
### Title: Predict from merMod objects with a prediction interval
### Aliases: predictInterval

### ** Examples

m1 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
regFit <- predict(m1, newdata = sleepstudy[11, ]) # a single value is returned
intFit <- predictInterval(m1, newdata = sleepstudy[11, ]) # bounded values
# Can do glmer
d1 <- cbpp
d1$y <- d1$incidence / d1$size
 gm2 <- glmer(y ~ period + (1 | herd), family = binomial, data = d1,
               nAGQ = 9, weights = d1$size)
 regFit <- predict(gm2, newdata = d1[1:10, ])
 # get probabilities
 regFit <- predict(gm2, newdata = d1[1:10, ], type = "response")
 intFit <- predictInterval(gm2, newdata = d1[1:10, ], type = "probability")
 intFit <- predictInterval(gm2, newdata = d1[1:10, ], type = "linear.prediction")



