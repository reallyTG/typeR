library(umx)


### Name: umxTwoStage
### Title: umxTwoStage
### Aliases: umxTwoStage

### ** Examples

library(umx)


# ====================================
# = Mendelian randomization analysis =
# ====================================

# Note: in practice: many more subjects are desirable - this just to let example run fast
df = umx_make_MR_data(1000) 
m1 = umxTwoStage(Y ~ X, instruments = ~ qtl, data = df)
parameters(m1)
plot(m1)

# Errant analysis using ordinary least squares regression (WARNING this result is CONFOUNDED!!)
m1 = lm(Y ~ X    , data = df); coef(m1) # incorrect .35 effect of X on Y
m1 = lm(Y ~ X + U, data = df); coef(m1) # Controlling U reveals the true 0.1 beta weight
#
#
## Not run: 
##D df = umx_make_MR_data(1e5) 
##D m1 = umxTwoStage(Y ~ X, instruments = ~ qtl, data = df)
##D 
##D # ======================
##D # = Now with sem::tsls =
##D # ======================
##D # library(sem) # will require you to install X11
##D m2 = sem::tsls(formula = Y ~ X, instruments = ~ qtl, data = df)
##D coef(m1)
##D coef(m2)
##D m3 = tsls(formula = Y ~ X, instruments = ~ qtl, data = (df[1, "qtl"] = NA))
## End(Not run)



