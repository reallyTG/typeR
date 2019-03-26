library(VGAM)


### Name: cens.poisson
### Title: Censored Poisson Family Function
### Aliases: cens.poisson
### Keywords: models regression

### ** Examples

# Example 1: right censored data
set.seed(123); U <- 20
cdata <- data.frame(y = rpois(N <- 100, exp(3)))
cdata <- transform(cdata, cy = pmin(U, y),
                          rcensored = (y >= U))
cdata <- transform(cdata, status = ifelse(rcensored, 0, 1))
with(cdata, table(cy))
with(cdata, table(rcensored))
with(cdata, table(print(SurvS4(cy, status))))  # Check; U+ means >= U
fit <- vglm(SurvS4(cy, status) ~ 1, cens.poisson, data = cdata,
            trace = TRUE)
coef(fit, matrix = TRUE)
table(print(depvar(fit)))  # Another check; U+ means >= U


# Example 2: left censored data
L <- 15
cdata <- transform(cdata,
               cY = pmax(L, y),
               lcensored = y <  L)  # Note y < L, not cY == L or y <= L
cdata <- transform(cdata, status = ifelse(lcensored, 0, 1))
with(cdata, table(cY))
with(cdata, table(lcensored))
with(cdata, table(print(SurvS4(cY, status, type = "left"))))  # Check
fit <- vglm(SurvS4(cY, status, type = "left") ~ 1, cens.poisson,
            data = cdata, trace = TRUE)
coef(fit, matrix = TRUE)


# Example 3: interval censored data
cdata <- transform(cdata, Lvec = rep(L, len = N),
                          Uvec = rep(U, len = N))
cdata <-
  transform(cdata,
        icensored = Lvec <= y & y < Uvec)  # Not lcensored or rcensored
with(cdata, table(icensored))
cdata <- transform(cdata, status = rep(3, N))  # 3 == interval censored
cdata <- transform(cdata,
         status = ifelse(rcensored, 0, status))  # 0 means right censored
cdata <- transform(cdata,
         status = ifelse(lcensored, 2, status))  # 2 means left  censored
# Have to adjust Lvec and Uvec because of the (start, end] format:
cdata$Lvec[with(cdata,icensored)] <- cdata$Lvec[with(cdata,icensored)]-1
cdata$Uvec[with(cdata,icensored)] <- cdata$Uvec[with(cdata,icensored)]-1
# Unchanged:
cdata$Lvec[with(cdata, lcensored)] <- cdata$Lvec[with(cdata, lcensored)]
cdata$Lvec[with(cdata, rcensored)] <- cdata$Uvec[with(cdata, rcensored)]
with(cdata,  # Check
 table(ii <- print(SurvS4(Lvec, Uvec, status, type = "interval"))))

fit <- vglm(SurvS4(Lvec, Uvec, status, type = "interval") ~ 1,
            cens.poisson, data = cdata, trace = TRUE)
coef(fit, matrix = TRUE)
table(print(depvar(fit)))  # Another check


# Example 4: Add in some uncensored observations
index <- (1:N)[with(cdata, icensored)]
index <- head(index, 4)
cdata$status[index] <- 1  # actual or uncensored value
cdata$Lvec[index] <- cdata$y[index]
with(cdata, table(ii <- print(SurvS4(Lvec, Uvec, status,
                                     type = "interval"))))  # Check

fit <- vglm(SurvS4(Lvec, Uvec, status, type = "interval") ~ 1,
            cens.poisson, data = cdata, trace = TRUE, crit = "c")
coef(fit, matrix = TRUE)
table(print(depvar(fit)))  # Another check



