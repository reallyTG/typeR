cat("\ntest HLfit:\n")
# HLfit

data("wafers")
## Gamma GLMM with log link
## also test that control.glm is syntactically correct
hl <- HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
            resid.model = ~ X3+I(X3^2) ,data=wafers,control.glm=list(maxit=100))
testthat::expect_equal(hl$APHLs$p_v,-1157.609,tolerance=1e-03)
AIC(hl)
simulate(hl,nsim=2)
