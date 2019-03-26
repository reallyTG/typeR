library(arm)


### Name: matching
### Title: Single Nearest Neighborhood Matching
### Aliases: matching
### Keywords: models methods

### ** Examples

# matching first
data(lalonde)
attach(lalonde)
fit <- glm(treat ~ re74 + re75 + age + factor(educ) + 
            black + hisp + married + nodegr + u74 + u75, 
            family=binomial(link="logit"))
pscores <- predict(fit, type="response")
matches <- matching(z=lalonde$treat, score=pscores)
matched <- lalonde[matches$matched,]

# balance check!
b.stats <- balance(lalonde, matched, fit)
print(b.stats)
plot(b.stats)



