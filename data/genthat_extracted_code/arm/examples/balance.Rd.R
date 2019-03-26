library(arm)


### Name: balance
### Title: Functions to compute the balance statistics
### Aliases: balance-class balance print.balance plot.balance
### Keywords: methods manip hplot dplot

### ** Examples

# matching first
old.par <- par(no.readonly = TRUE)
data(lalonde)
attach(lalonde)
fit <- glm(treat ~ re74 + re75 + age + factor(educ) + 
            black + hisp + married + nodegr + u74 + u75, 
            family=binomial(link="logit"))
pscores <- predict(fit, type="link")
matches <- matching(z=lalonde$treat, score=pscores)
matched <- lalonde[matches$matched,]

# balance check
b.stats <- balance(lalonde, matched, fit)
print(b.stats)
plot(b.stats)
par(old.par)



