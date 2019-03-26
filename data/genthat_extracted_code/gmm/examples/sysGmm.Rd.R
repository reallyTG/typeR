library(gmm)


### Name: sysGmm
### Title: Generalized method of moment estimation for system of equations
### Aliases: sysGmm five sur randEffect threeSLS

### ** Examples


data(wage)

eq1 <- LW~S+IQ+EXPR
eq2 <- LW80~S80+IQ+EXPR80
g2 <- list(Wage69=eq1, WAGE80=eq2)
h2 <- list(~S+EXPR+MED+KWW, ~S80+EXPR80+MED+KWW)

res <- sysGmm(g2, h2, data=wage, commonCoef=TRUE)
summary(res)

res2 <- sysGmm(g2, h2, data=wage)
summary(res2)

five(g2, h2, data=wage)

threeSLS(g2, h2[[1]], data=wage)

sur(g2, data=wage)

randEffect(g2, data=wage)

## Cross-Equation restrictions
## All but the intercept are assumed to be the same

res <- sysGmm(g2, h2, data=wage, crossEquConst = 2:4)
summary(res)




