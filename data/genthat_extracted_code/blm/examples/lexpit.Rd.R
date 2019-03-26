library(blm)


### Name: lexpit
### Title: Fit a linear-expit regression model
### Aliases: lexpit

### ** Examples


data(ccdata)

fit <- lexpit(y~female,y~packyear,weights = ccdata$w,
       		strata=ccdata$strata,data=ccdata)

summary(fit)

# LEXPIT MODEL FOR BLADDER CANCER RISK BY AGE 70
formula.linear <- bladder70~female * smoke_status
formula.expit <- bladder70~redmeat+fiber.centered+I(fiber.centered^2)

# ADDITIVE EFFECTS FOR GENDER AND SMOKING
# LOGISTIC EFFECTS FOR FIBER AND REDMEAT CONSUMPTION
data(aarp)

fit <- lexpit(formula.linear, formula.expit, aarp, weight=aarp$w)
logLik(fit)

model.formula(fit)

# SUMMARY
summary(fit)
confint(fit)

# FITTED ABSOLUTE RISK PER 1,000 PERSONS
head(predict(fit)*1000)



