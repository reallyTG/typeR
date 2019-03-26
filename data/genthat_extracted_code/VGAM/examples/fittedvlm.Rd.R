library(VGAM)


### Name: fittedvlm
### Title: Fitted Values of a VLM object
### Aliases: fittedvlm fitted.values.vlm
### Keywords: models regression

### ** Examples

# Categorical regression example 1
pneumo <- transform(pneumo, let = log(exposure.time))
(fit1 <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
fitted(fit1)

# LMS quantile regression example 2
fit2 <- vgam(BMI ~ s(age, df = c(4, 2)),
             lms.bcn(zero = 1), data = bmi.nz, trace = TRUE)
head(predict(fit2, type = "response"))  # Equal to the the following two:
head(fitted(fit2))
predict(fit2, type = "response", newdata = head(bmi.nz))

# Zero-inflated example 3
zdata <- data.frame(x2 = runif(nn <- 1000))
zdata <- transform(zdata, pstr0.3  = logit(-0.5       , inverse = TRUE),
                          lambda.3 =  loge(-0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y1 = rzipois(nn, lambda = lambda.3, pstr0 = pstr0.3))
fit3 <- vglm(y1 ~ x2, zipoisson(zero = NULL), data = zdata, trace = TRUE)
head(fitted(fit3, type.fitted = "mean" ))      # E(Y), which is the default
head(fitted(fit3, type.fitted = "pobs0"))      # P(Y = 0)
head(fitted(fit3, type.fitted = "pstr0"))      #     Prob of a structural 0
head(fitted(fit3, type.fitted = "onempstr0"))  # 1 - prob of a structural 0



