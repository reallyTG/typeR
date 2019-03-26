library(coxrt)


### Name: coxph.RT
### Title: Fits Cox Regression Model Using Right Truncated Data
### Aliases: coxph.RT

### ** Examples

# loading AIDS data set
library(gss)
data(aids)
s <- data.frame(age=aids$age, ageg=as.numeric(aids$age<=4), T=aids$incu, R=aids$infe)
s$T[s$T==0] <- 0.5 # as in Kalbfeisch and Lawless (1989)

# analysis assuming positivity
# we request bootstrap SE estimate as well:
sol <- coxph.RT(T~ageg, right=R, data=s, bs=FALSE)
sol
sol$summary # print the summary of fit based on the analytic Asymptotic Standard Error estimate




