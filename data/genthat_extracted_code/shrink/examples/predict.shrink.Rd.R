library(shrink)


### Name: predict.shrink
### Title: Predict Method for Objects of Class 'shrink'
### Aliases: predict.shrink

### ** Examples

data("GBSG")
library("mfp")

fit <- mfp(Surv(rfst, cens) ~ fp(age, df = 4, select = 0.05) +
           fp(prm, df = 4, select = 0.05), family = cox, data = GBSG)

dfbeta.global <- shrink(fit, type = "global",  method = "dfbeta")
dfbeta.pw     <- shrink(fit, type = "parameterwise", method = "dfbeta")
dfbeta.join   <- shrink(fit, type = "parameterwise", method = "dfbeta",
                        join=list(c("age.1", "age.2")))

age <- 30:80
newdat <- data.frame(age = age, prm = 0)
refdat <- data.frame(age = 50, prm = 0)

# unshrunken
plot(age, predict(fit, newdata = newdat, type = "lp") -
       predict(fit, newdata = refdat, type = "lp"), xlab = "Age",
     ylab = "Log hazard relative to 50 years", type = "l", lwd = 2)

# globally shrunken
lines(age, predict(dfbeta.global,newdata = newdat, type = "lp") -
        predict(dfbeta.global, newdata = refdat, type = "lp"), lty = 3, col = "red", lwd = 2)

# jointly shrunken
lines(age, predict(dfbeta.join, newdata = newdat, type = "lp") -
        predict(dfbeta.join, newdata = refdat, type = "lp"), lty = 4, col = "blue", lwd = 2)

# parameterwise shrunken
lines(age, predict(dfbeta.pw, newdata = newdat, type = "lp") -
        predict(dfbeta.pw, newdata =refdat, type = "lp"), lty = 2, col = "green", lwd = 2)

legend("topright", lty = c(1, 3, 4, 2), title = "SHRINKAGE",
       legend = c("No", "Global", "Joint", "Parameterwise"), inset = 0.01, bty = "n",
       col = c("black", "red", "blue", "green"), lwd = 2)



