library(IPWsurvival)


### Name: adjusted.LR
### Title: Log-Rank Test for Adjusted Survival Curves.
### Aliases: adjusted.LR

### ** Examples


data(DIVAT)

# adjusted log-rank test
Pr0 <- glm(ecd ~ 1, family = binomial(link="logit"), data=DIVAT)$fitted.values[1]
Pr1 <- glm(ecd ~ age + hla + retransplant, data=DIVAT,
 family=binomial(link = "logit"))$fitted.values
W <- (DIVAT$ecd==1) * (1/Pr1) + (DIVAT$ecd==0) * (1)/(1-Pr1)

adjusted.LR(DIVAT$times, DIVAT$failures, DIVAT$ecd, W)




