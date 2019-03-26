library(sjstats)


### Name: odds_to_rr
### Title: Get relative risks estimates from logistic regressions or odds
###   ratio values
### Aliases: odds_to_rr or_to_rr

### ** Examples

library(sjmisc)
library(lme4)
# create binary response
sleepstudy$Reaction.dicho <- dicho(sleepstudy$Reaction, dich.by = "median")
# fit model
fit <- glmer(Reaction.dicho ~ Days + (Days | Subject),
             data = sleepstudy, family = binomial("logit"))
# convert to relative risks
odds_to_rr(fit)


data(efc)
# create binary response
y <- ifelse(efc$neg_c_7 < median(na.omit(efc$neg_c_7)), 0, 1)
# create data frame for fitted model
mydf <- data.frame(y = as.factor(y),
                   sex = efc$c161sex,
                   dep = to_factor(efc$e42dep),
                   barthel = efc$barthtot,
                   education = to_factor(efc$c172code))
# fit model
fit <- glm(y ~., data = mydf, family = binomial(link = "logit"))
# convert to relative risks
odds_to_rr(fit)

# replicate OR/RR for coefficient "sex" from above regression
or_to_rr(1.913887, .5516)




