library(bayesDP)


### Name: bdpsurvival
### Title: Bayesian Discount Prior: Survival Analysis
### Aliases: bdpsurvival bdpsurvival,ANY-method

### ** Examples

# One-arm trial (OPC) example - survival probability at 5 years

# Collect data into data frames
df_ <- data.frame(status = rexp(50, rate=1/30),
                  time   = rexp(50, rate=1/20))
df_$status <- ifelse(df_$time < df_$status, 1, 0)

df0 <- data.frame(status = rexp(50, rate=1/30),
                  time   = rexp(50, rate=1/10))
df0$status <- ifelse(df0$time < df0$status, 1, 0)


fit1 <- bdpsurvival(Surv(time, status) ~ 1,
                    data  = df_,
                    data0 = df0,
                    surv_time = 5,
                    method = "fixed")

print(fit1)
## Not run: 
##D plot(fit1)
## End(Not run)

# Two-arm trial example
# Collect data into data frames
df_ <- data.frame(time = c(rexp(50, rate=1/20),  # Current treatment
                           rexp(50, rate=1/10)), # Current control
                  status = rexp(100, rate=1/40),
                  treatment = c(rep(1,50), rep(0,50)))
df_$status <- ifelse(df_$time < df_$status, 1, 0)

df0 <- data.frame(time = c(rexp(50, rate=1/30),  # Historical treatment
                           rexp(50, rate=1/5)),  # Historical control
                  status =  rexp(100, rate=1/40),
                  treatment = c(rep(1,50), rep(0,50)))
df0$status <- ifelse(df0$time < df0$status, 1, 0)

fit2 <- bdpsurvival(Surv(time, status) ~ treatment,
                    data = df_,
                    data0 = df0,
                    method = "fixed")
summary(fit2)

### Fix alpha at 1
fit2_1 <- bdpsurvival(Surv(time, status) ~ treatment,
                      data = df_,
                      data0 = df0,
                      fix_alpha = TRUE,
                      method = "fixed")
summary(fit2_1)





