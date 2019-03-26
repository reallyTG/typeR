library(spaMM)


### Name: LRT
### Title: Likelihood ratio test of fixed effects.
### Aliases: anova anova.HLfit LRT
### Keywords: htest

### ** Examples

data("wafers")
## Gamma GLMM with log link
m1 <- HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          resid.model = ~ X3+I(X3^2) ,data=wafers,HLmethod="ML")
m2 <- update(m1,formula.= ~ . -I(X2^2))
anova(m1,m2)

# Using resp_testfn argument:
## Not run: 
##D set.seed(1L)
##D d <- data.frame(success = rbinom(10, size = 1, prob = 0.9), x = 1:10)
##D xx <- cbind(1,d$x)
##D table(d$success)
##D m_x <- fitme(success ~ x, data = d, family = binomial())
##D m_0 <- fitme(success ~ 1, data = d, family = binomial())
##D anova(m_x, m_0, boot.repl = 100,
##D       resp_testfn=function(y) {! is_separated(xx,as.numeric(y),verbose=FALSE)})
## End(Not run)




