## ----R_setup, include=FALSE----------------------------------------------
library(knitr)
knitr::opts_chunk$set(warning = FALSE)

opts_chunk$set(tidy=TRUE, tidy.opts=list(width.cutoff=80)) #{r, tidy=TRUE, tidy.opts=list(width.cutoff=60)}

# # source: https://github.com/yihui/knitr-examples/blob/master/077-wrap-output.Rmd
# knitr::opts_chunk$set(linewidth = NULL)
# hook_output = knit_hooks$get('output')
# knit_hooks$set(output = function(x, options) {
#   # this hook is used only when the linewidth option is not NULL
#   if (!is.null(n <- options$linewidth)) {
#     x = knitr:::split_lines(x)
#     # any lines wider than n should be wrapped
#     if (any(nchar(x) > n)) x = strwrap(x, width = n)
#     x = paste(x, collapse = '\n')
#   }
#   hook_output(x, options)
# })

## ----eval=FALSE----------------------------------------------------------
## install.packages("hdm")

## ----eval=FALSE----------------------------------------------------------
## install.packages("hdm", repos="http://R-Forge.R-project.org")

## ----echo=TRUE-----------------------------------------------------------
library(hdm)

## ----echo=FALSE,results='hide'-------------------------------------------
library(hdm); library(ggplot2); library(Formula)
options(width=60)


## ----eval=FALSE----------------------------------------------------------
## help(package="hdm")
## help(rlasso)

## ----eval=FALSE----------------------------------------------------------
##  help.start()

## ----eval=FALSE----------------------------------------------------------
## example(rlasso)

## ----DGP_lasso1----------------------------------------------------------
set.seed(12345)
n = 100 #sample size
p = 100 # number of variables
s = 3 # nubmer of variables with non-zero coefficients
X = matrix(rnorm(n*p), ncol=p)
beta = c(rep(5,s), rep(0,p-s))
Y = X%*%beta + rnorm(n)

## ----Estimation_lasso1---------------------------------------------------
lasso.reg = rlasso(Y~X,post=FALSE)  # use lasso, not-Post-lasso
# lasso.reg = rlasso(X, Y, post=FALSE)
sum.lasso <- summary(lasso.reg, all=FALSE) # can also do print(lasso.reg, all=FALSE)
yhat.lasso = predict(lasso.reg)   #in-sample prediction
Xnew = matrix(rnorm(n*p), ncol=p)  # new X
Ynew =  Xnew%*%beta + rnorm(n)  #new Y
yhat.lasso.new = predict(lasso.reg, newdata=Xnew)  #out-of-sample prediction

post.lasso.reg = rlasso(Y~X,post=TRUE) #now use post-lasso
print(post.lasso.reg, all=FALSE)    # or use  summary(post.lasso.reg, all=FALSE) 
yhat.postlasso = predict(post.lasso.reg)  #in-sample prediction
yhat.postlasso.new = predict(post.lasso.reg, newdata=Xnew)  #out-of-sample prediction
MAE<- apply(cbind(abs(Ynew-yhat.lasso.new), abs(Ynew - yhat.postlasso.new)),2, mean)
names(MAE)<- c("lasso MAE", "Post-lasso MAE")
print(MAE, digits=2)  # MAE for Lasso and Post-Lasso

## ----simulation_partialling_out------------------------------------------
set.seed(1)
n =5000; p = 20;  X = matrix(rnorm(n*p), ncol=p)
colnames(X) = c("d", paste("x", 1:19, sep=""));xnames = colnames(X)[-1]
beta = rep(1,20)
y = X%*%beta + rnorm(n)
dat = data.frame(y=y, X)

## ----simulation_partialling_out_full_fit---------------------------------
# full fit
fmla = as.formula(paste("y ~ ", paste(colnames(X), collapse= "+")))
full.fit= lm(fmla, data=dat)
summary(full.fit)$coef["d",1:2]

## ----simulation_partialling_out_partial_fit------------------------------
fmla.y = as.formula(paste("y ~ ", paste(xnames,  collapse= "+")))
fmla.d = as.formula(paste("d ~ ", paste(xnames, collapse= "+")))
# partial fit via ols
rY = lm(fmla.y, data = dat)$res
rD = lm(fmla.d, data = dat)$res
partial.fit.ls= lm(rY~rD)
summary(partial.fit.ls)$coef["rD",1:2]

## ----simulation_partialling_out_partial_fit_lasso------------------------
# partial fit via post-lasso
rY = rlasso(fmla.y, data =dat)$res
rD = rlasso(fmla.d, data =dat)$res
partial.fit.postlasso= lm(rY~rD)
summary(partial.fit.postlasso)$coef["rD",1:2]

## ----simulation_partialling_out_rlassoEffectone--------------------------
Eff= rlassoEffect(X[,-1],y,X[,1], method="partialling out")
summary(Eff)$coef[,1:2]

## ----simulation_doubleselection_rlassoEffectone--------------------------
Eff= rlassoEffect(X[,-1],y,X[,1], method="double selection")
summary(Eff)$coef[,1:2]

## ----DGP_lasso-----------------------------------------------------------
set.seed(1)
n = 100 #sample size
p = 100 # number of variables
s = 3 # nubmer of non-zero variables
X = matrix(rnorm(n*p), ncol=p)
colnames(X) <- paste("X", 1:p, sep="")
beta = c(rep(3,s), rep(0,p-s))
y = 1 + X%*%beta + rnorm(n)
data = data.frame(cbind(y,X))
colnames(data)[1] <- "y"
fm = paste("y ~", paste(colnames(X), collapse="+"))
fm = as.formula(fm)                 

## ----Estimation_inference------------------------------------------------
#lasso.effect = rlassoEffects(X, y, index=c(1,2,3,50))
lasso.effect = rlassoEffects(fm, I = ~ X1 + X2 + X3 + X50, data=data)
print(lasso.effect)
summary(lasso.effect)
confint(lasso.effect)

## ----joint_Estimation_inference------------------------------------------
confint(lasso.effect, level=0.95, joint=TRUE)

## ----lasso_plot, eval=FALSE----------------------------------------------
## plot(lasso.effect, main="Confidence Intervals")

## ----cps_example---------------------------------------------------------
library(hdm)
data(cps2012)
X <- model.matrix( ~ -1 + female + female:(widowed + divorced + separated + nevermarried  + 
hsd08+hsd911+ hsg+cg+ad+mw+so+we+exp1+exp2+exp3) + 
+ (widowed + divorced + separated + nevermarried  +
 hsd08+hsd911+ hsg+cg+ad+mw+so+we+exp1+exp2+exp3)^2, data=cps2012)
dim(X)
X <- X[,which(apply(X, 2, var)!=0)] # exclude all constant variables
dim(X)
index.gender <- grep("female", colnames(X))
y <- cps2012$lnw

## ----Joint_Estimation----------------------------------------------------
effects.female <- rlassoEffects(x=X, y=y, index=index.gender)
summary(effects.female)

## ----CPS_example---------------------------------------------------------
joint.CI <- confint(effects.female, level = 0.95, joint = TRUE)
joint.CI
# plot(effects.female, joint=TRUE, level=0.95) # plot of the effects

## ----CPS_Example_formula, eval=FALSE-------------------------------------
## effects.female <- rlassoEffects(lnw ~ female + female:(widowed + divorced + separated + nevermarried  +
## hsd08+hsd911+ hsg+cg+ad+mw+so+we+exp1+exp2+exp3)+
## (widowed + divorced + separated + nevermarried  +
## hsd08+hsd911+ hsg+cg+ad+mw+so+we+exp1+exp2+exp3)^2, data=cps2012,
## I = ~  female + female:(widowed + divorced + separated + nevermarried  +
##  hsd08+hsd911+ hsg+cg+ad+mw+so+we+exp1+exp2+exp3))

## ----Growth_processing---------------------------------------------------
data(GrowthData)
dim(GrowthData)
y = GrowthData[,1,drop=F]
d = GrowthData[,3, drop=F]
X = as.matrix(GrowthData)[,-c(1,2,3)]
varnames = colnames(GrowthData)

## ------------------------------------------------------------------------
xnames= varnames[-c(1,2,3)] # names of X variables
dandxnames= varnames[-c(1,2)] # names of D and X variables
# create formulas by pasting names (this saves typing times)
fmla= as.formula(paste("Outcome ~ ", paste(dandxnames, collapse= "+")))
ls.effect= lm(fmla, data=GrowthData)

## ----Growth_analysis-----------------------------------------------------
dX = as.matrix(cbind(d,X))
lasso.effect = rlassoEffect(x=X, y=y, d=d, method="partialling out")
summary(lasso.effect)

## ----Growth_analysis2----------------------------------------------------
dX = as.matrix(cbind(d,X))
doublesel.effect = rlassoEffect(x=X, y=y, d=d, method="double selection")
summary(doublesel.effect)

## ----summary_results, results="hide"-------------------------------------
library(xtable)
table= rbind(summary(ls.effect)$coef["gdpsh465",1:2],
  summary(lasso.effect)$coef[,1:2],
  summary(doublesel.effect)$coef[,1:2])
colnames(table)= c("Estimate", "Std. Error") #names(summary(full.fit)$coef)[1:2]
rownames(table)= c("full reg via ols",  "partial reg
via post-lasso ", "partial reg via double selection")
tab= xtable(table, digits=c(2, 2,5))

## ----results="asis"------------------------------------------------------
tab

## ----AJR_processing------------------------------------------------------
data(AJR); y = AJR$GDP; d = AJR$Exprop; z = AJR$logMort
x = model.matrix(~ -1 + (Latitude + Latitude2 + Africa + 
                  Asia + Namer + Samer)^2, data=AJR)
dim(x)

## ----AJR_analysis--------------------------------------------------------
#AJR.Xselect = rlassoIV(x=x, d=d, y=y, z=z, select.X=TRUE, select.Z=FALSE)
AJR.Xselect = rlassoIV(GDP ~ Exprop +  (Latitude + Latitude2 + Africa + 
                  Asia + Namer + Samer)^2 | logMort +  (Latitude + Latitude2 + Africa + 
                  Asia + Namer + Samer)^2, data=AJR, select.X=TRUE, select.Z=FALSE)
summary(AJR.Xselect)
confint(AJR.Xselect)

## ----AJR_partiallingout_ols----------------------------------------------
# parialling out by linear model
fmla.y = GDP ~ (Latitude + Latitude2 + Africa + Asia + Namer + Samer)^2
fmla.d = Exprop ~ (Latitude + Latitude2 + Africa + Asia + Namer + Samer)^2
fmla.z = logMort ~ (Latitude + Latitude2 + Africa + Asia + Namer + Samer)^2
rY = lm(fmla.y, data = AJR)$res
rD = lm(fmla.d, data = AJR)$res
rZ = lm(fmla.z, data = AJR)$res
#ivfit.lm = tsls(y=rY,d=rD, x=NULL, z=rZ, intercept=FALSE)
ivfit.lm = tsls(rY ~ rD | rZ, intercept = FALSE)
print(cbind(ivfit.lm$coef, ivfit.lm$se),digits=3)

## ----AJR_partiallingout_lasso--------------------------------------------
# parialling out by lasso
rY = rlasso(fmla.y, data = AJR)$res
rD = rlasso(fmla.d, data = AJR)$res
rZ = rlasso(fmla.z, data = AJR)$res
#ivfit.lasso = tsls(y=rY,d=rD, x=NULL, z=rZ, intercept=FALSE)
ivfit.lasso = tsls(rY ~ rD | rZ, intercept = FALSE)
print(cbind(ivfit.lasso$coef, ivfit.lasso$se), digits=3)

## ----lassoIV-------------------------------------------------------------
data(EminentDomain)
z <- as.matrix(EminentDomain$logGDP$z)
x <- as.matrix(EminentDomain$logGDP$x)
y <- EminentDomain$logGDP$y
d <- EminentDomain$logGDP$d
x <- x[,apply(x, 2, mean, na.rm=TRUE) > 0.05] #
z <- z[,apply(z, 2, mean, na.rm=TRUE) > 0.05] # 

## ----OLS_EminentDomina---------------------------------------------------
ED.ols = lm(y~cbind(d,x))
ED.2sls = tsls(y=y, d=d, x=x, z=z[,1:2], intercept=FALSE)

## ----ED_analysis---------------------------------------------------------
lasso.IV.Z = rlassoIV(x=x, d=d, y=y, z=z, select.X=FALSE, select.Z=TRUE) 
# or lasso.IV.Z = rlassoIVselectZt(x=X, d=d, y=y, z=z) 
summary(lasso.IV.Z)
confint(lasso.IV.Z)

## ----lassoIV_analysis----------------------------------------------------
lasso.IV.XZ = rlassoIV(x=x, d=d, y=y, z=z, select.X=TRUE, select.Z=TRUE) 
summary(lasso.IV.XZ)
confint(lasso.IV.XZ)

## ----summary_results_ED,  include=TRUE-----------------------------------
library(xtable)
table= matrix(0, 4, 2)
table[1,]= summary(ED.ols)$coef[2,1:2]
table[2,]= cbind(ED.2sls$coef[1], ED.2sls$se[1])
table[3,]= summary(lasso.IV.Z)[,1:2]
table[4,]= summary(lasso.IV.XZ)[,1:2]
colnames(table)= c("Estimate", "Std. Error")
rownames(table)= c("ols regression",  "IV estimation ", "selection on Z", "selection on X and Z")
tab= xtable(table, digits=c(2, 2,7))

## ----results="asis"------------------------------------------------------
tab

## ----401_processing------------------------------------------------------
data(pension)
y = pension$tw; d = pension$p401; z = pension$e401
X = pension[,c("i2", "i3", "i4", "i5", "i6", "i7", "a2", "a3", "a4", "a5",
    "fsize", "hs", "smcol", "col", "marr", "twoearn", "db", "pira", "hown")] # simple model
xvar = c("i2", "i3", "i4", "i5", "i6", "i7", "a2", "a3", "a4", "a5",
    "fsize", "hs", "smcol", "col", "marr", "twoearn", "db", "pira", "hown")
xpart = paste(xvar, collapse = "+")
form = as.formula(paste("tw ~ ", paste(c("p401", xvar), collapse ="+"), "|",   paste(xvar, collapse = "+")))
formZ = as.formula(paste("tw ~ ", paste(c("p401", xvar), collapse ="+"), "|",   paste(c("e401", xvar), collapse = "+")))

## ----401_analysis_ATE----------------------------------------------------
#pension.ate =  rlassoATE(X,d,y)
pension.ate = rlassoATE(form, data = pension)
summary(pension.ate)
#pension.atet =  rlassoATET(X,d,y)
pension.atet = rlassoATET(form, data = pension)
summary(pension.atet)

## ----401_analysis_LATE---------------------------------------------------
pension.late = rlassoLATE(X,d,y,z)
#pension.late = rlassoLATE(formZ, data=pension)
summary(pension.late)
pension.latet = rlassoLATET(X,d,y,z)
#pension.latet = rlassoLATET(formZ, data=pension)
summary(pension.latet)

## ----summary_pension, include=TRUE---------------------------------------
library(xtable)
table= matrix(0, 4, 2)
table[1,]= summary(pension.ate)[,1:2]
table[2,]= summary(pension.atet)[,1:2]
table[3,]= summary(pension.late)[,1:2]
table[4,]= summary(pension.latet)[,1:2]
colnames(table)= c("Estimate", "Std. Error")
rownames(table)= c("ATE",  "ATET ", "LATE", "LATET")
tab= xtable(table, digits=c(2, 2,2))

## ----results="asis",echo=FALSE-------------------------------------------
tab

## ----401_processing_interaction------------------------------------------
#X = model.matrix(~ -1 + (i2 + i3 + i4 + i5 + i6 + i7 + a2 + a3 + a4 + a5 +
#                  fsize + hs + smcol + col + marr + twoearn + db + pira + hown)^2, data = pension) # model with interactions
xvar2 <- paste("(", xvar, ")^2", sep="")
formExt = as.formula(paste("tw ~ ", paste(c("p401", xvar2), collapse ="+"), "|",   paste(xvar2, collapse = "+")))
formZExt = as.formula(paste("tw ~ ", paste(c("p401", xvar2), collapse ="+"), "|",   paste(c("e401", xvar2), collapse = "+")))

## ----401_analysis_interaction, results="hide", echo="FALSE"--------------
pension.ate =  rlassoATE(X,z,y)
pension.atet =  rlassoATET(X,z,y)
pension.late = rlassoLATE(X,d,y,z)
pension.latet = rlassoLATET(X,d,y,z)
#pension.ate =  rlassoATE(formExt, data = pension)
#pension.atet =  rlassoATET(formExt, data = pension)
#pension.late = rlassoLATE(formZExt, data = pension)
#pension.latet = rlassoLATET(formZExt, data = pension)
table= matrix(0, 4, 2)
table[1,]= summary(pension.ate)[,1:2]
table[2,]= summary(pension.atet)[,1:2]
table[3,]= summary(pension.late)[,1:2]
table[4,]= summary(pension.latet)[,1:2]
colnames(table)= c("Estimate", "Std. Error")
rownames(table)= c("ATE",  "ATET ", "LATE", "LATET")
tab= xtable(table, digits=c(2, 2,2))

## ----results="asis",echo=FALSE-------------------------------------------
tab

## ----lasso---------------------------------------------------------------
#library(hdm)
#library(stats)
set.seed(1)
n = 100
p1 = 20
p2= 20
D= matrix(rnorm(n*p1), n, p1)  # Causes
W= matrix(rnorm(n*p2), n, p2)  # Controls
X = cbind(D,W)   # Regressors
Y = D[,1]*5 + W[,1]*5 + rnorm(n)  #Outcome
confint(rlassoEffects(X,Y, index=c(1:p1)), joint=TRUE) 
#BCK Joint Confidence Band for Reg Coefficients 1 to 20

## ----results="hide"------------------------------------------------------
data(pension)

## ----eval=FALSE----------------------------------------------------------
## help(pension)

## ----results="hide"------------------------------------------------------
data(GrowthData)

## ----results="hide"------------------------------------------------------
data(AJR)

## ----results="hide"------------------------------------------------------
data(EminentDomain)

## ----results="hide"------------------------------------------------------
data(BLP)

## ----results="hide"------------------------------------------------------
data(cps2012)

