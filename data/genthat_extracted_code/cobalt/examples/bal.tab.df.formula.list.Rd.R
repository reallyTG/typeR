library(cobalt)


### Name: bal.tab.df.formula.list
### Title: Balance Statistics for Longitudinal Treatments
### Aliases: bal.tab.time.list bal.tab.list bal.tab.formula.list
###   bal.tab.data.frame.list

### ** Examples

data("iptwExWide", package = "twang")
library("cobalt")

## Estimating longitudinal propensity scores and weights
ps1 <- glm(tx1 ~ age + gender + use0,
            data = iptwExWide, 
            family = "binomial")$fitted.values
w1 <- ifelse(iptwExWide$tx1 == 1, 1/ps1, 1/(1-ps1))
ps2 <- glm(tx2 ~ age + gender + use0 + tx1 + use1,
            data = iptwExWide, 
            family = "binomial")$fitted.values
w2 <- ifelse(iptwExWide$tx2 == 1, 1/ps2, 1/(1-ps2))
ps3 <- glm(tx3 ~ age + gender + use0 + tx1 + use1 + tx2 + use2,
            data = iptwExWide, 
            family = "binomial")$fitted.values
w3 <- ifelse(iptwExWide$tx3 == 1, 1/ps3, 1/(1-ps3))
                     
w <- w1*w2*w3

# data frame interface:
bal.tab(list(iptwExWide[c("use0", "gender")],
             iptwExWide[c("use0", "gender", "use1", "tx1")],
             iptwExWide[c("use0", "gender", "use1", "tx1", "use2", "tx2")]),
        treat.list = iptwExWide[c("tx1", "tx2", "tx3")], 
        weights = w,
        distance.list = list(ps1, ps2, ps3),
        addl.list = iptwExWide["age"],
        un = TRUE)

# Formula interface:
bal.tab(list(tx1 ~ use0 + gender,
             tx2 ~ use0 + gender + use1 + tx1,
             tx3 ~ use0 + gender + use1 + tx1 + use2 + tx2),
        data = iptwExWide, 
        weights = w,
        distance.list = list(ps1, ps2, ps3),
        addl.list = "age",
        un = TRUE)



