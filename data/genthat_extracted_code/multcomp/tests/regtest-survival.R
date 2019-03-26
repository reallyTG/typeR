
library("survival")
library("multcomp")
set.seed(29)

bladder1 <- bladder[bladder$enum < 5, ] 
bladder1$number <- as.factor(bladder1$number)

cm <- coxph(Surv(stop, event) ~ rx + size + number + strata(enum) + 
            cluster(id), data = bladder1)
summary(glht(cm, mcp(number = "Dunnett")))

wm <- survreg(Surv(stop, event) ~ rx + size + number + strata(enum) + 
              cluster(id), data = bladder1)
summary(glht(wm, mcp(number = "Dunnett")))

