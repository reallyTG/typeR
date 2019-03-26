library(frailtyEM)


### Name: predict.emfrail
### Title: Predicted hazard and survival curves from an 'emfrail' object
### Aliases: predict.emfrail

### ** Examples

kidney$sex <- ifelse(kidney$sex == 1, "male", "female")
m1 <- emfrail(formula = Surv(time, status) ~  sex + age  + cluster(id),
              data =  kidney)

# get all the possible prediction for the value 0 of the linear predictor
predict(m1, lp = 0)

# get the cumulative hazards for two different values of the linear predictor
predict(m1, lp = c(0, 1), quantity = "cumhaz", conf_int = NULL)

# get the cumulative hazards for a female and for a male, both aged 30
newdata1 <- data.frame(sex = c("female", "male"),
                       age = c(30, 30))

predict(m1, newdata = newdata1, quantity = "cumhaz", conf_int = NULL)

# get the cumulative hazards for an individual that changes
# sex from female to male at time 40.
newdata2 <- data.frame(sex = c("female", "male"),
                      age = c(30, 30),
                      tstart = c(0, 40),
                      tstop = c(40, Inf))

predict(m1, newdata = newdata2,
        individual = TRUE,
        quantity = "cumhaz", conf_int = NULL)




