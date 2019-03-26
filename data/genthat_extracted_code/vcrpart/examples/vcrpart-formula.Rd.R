library(vcrpart)


### Name: vcrpart-formula
### Title: Special terms for formulas.
### Aliases: vcrpart-formula fe vc re ce ge

### ** Examples

## Formula for a model with 2 fixed effects (x1 and x2) and a random
## intercept. The 're' terms indicates that an intercept is fitted for
## each level of 'id'.

formula <- y ~ fe(x1 + x2) + re(1|id)

## Formula for a model with one fixed effect and one varying coefficient
## term with 2 moderators and 2 varying coefficient predictors. 'tvcm'
## will fit one partition to model the effects of 'x2' and 'x3' as
## functions of 'z1' and 'z2'.

formula <- y ~ x1 + vc(z1, z2, by = x2 + x3, intercept = TRUE)

## Similar formula as above, but the predictors 'x2' and 'x3' have
## separate 'vc' terms. 'tvcm' will fit a separate partition for each of
## 'x2' and 'x3' to model their effects as functions of 'z1' and 'z2'.

formula <- y ~ x1 + vc(z1, z2, by = x2) + vc(z1, z2, by = x3)

## As an alternative to '.' you can define variables in a vector
vars <- c("x1", "x2", "x3")
formula <- y ~ x1 + vc(vars, by = x2) + vc(vars, by = x3)



