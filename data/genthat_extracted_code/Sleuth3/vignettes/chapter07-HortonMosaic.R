## ----setup, include=FALSE, cache=FALSE, echo=FALSE, message=FALSE--------
require(knitr)
opts_chunk$set(
  dev="pdf",
  fig.path="figures/",
  fig.height=3,
        fig.width=4,
        out.width=".47\\textwidth",
        fig.keep="high",
        fig.show="hold",
        fig.align="center",
        prompt=TRUE,  # show the prompts; but perhaps we should not do this 
        comment=NA    # turn off commenting of ouput (but perhaps we should not do this either
  )
require(Sleuth3)
require(mosaic)
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
set.seed(123)
# this allows for code formatting inline.  Use \Sexpr{'function(x,y)'}, for exmaple.
knit_hooks$set(inline = function(x) {
if (is.numeric(x)) return(knitr:::format_sci(x, 'latex'))
x = as.character(x)
h = knitr:::hilight_source(x, 'latex', list(prompt=FALSE, size='normalsize'))
h = gsub("([_#$%&])", "\\\\\\1", h)
h = gsub('(["\'])', '\\1{}', h)
gsub('^\\\\begin\\{alltt\\}\\s*|\\\\end\\{alltt\\}\\s*$', '', h)
})
showOriginal=FALSE
showNew=TRUE

## ----pvalues, echo=FALSE, message=FALSE----------------------------------
print.pval = function(pval) {
  threshold = 0.0001
    return(ifelse(pval < threshold, paste("p<", sprintf("%.4f", threshold), sep=""),
                ifelse(pval > 0.1, paste("p=",round(pval, 2), sep=""),
                       paste("p=", round(pval, 3), sep=""))))
}

## ----install_mosaic,eval=FALSE-------------------------------------------
## install.packages('mosaic')               # note the quotation marks

## ----load_mosaic,eval=FALSE----------------------------------------------
## require(mosaic)

## ----install_Sleuth3,eval=FALSE------------------------------------------
## install.packages('Sleuth3')               # note the quotation marks

## ----load_Sleuth3,eval=FALSE---------------------------------------------
## require(Sleuth3)

## ----eval=TRUE-----------------------------------------------------------
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
options(digits=4)

## ------------------------------------------------------------------------
summary(case0701)

## ------------------------------------------------------------------------
histogram(~ Velocity, type='density', density=TRUE, nint=10, data=case0701)
histogram(~ Distance, type='density', density=TRUE, nint=10, data=case0701)

## ------------------------------------------------------------------------
xyplot(Distance ~ Velocity, type=c("p", "r"), data=case0701)

## ------------------------------------------------------------------------
lm1 = lm(Distance ~ Velocity, data=case0701)
summary(lm1)

## ------------------------------------------------------------------------
fitted(lm1)
resid(lm1)^2
sum(resid(lm1)^2)
sum(resid(lm1)^2)/sum((fitted(lm1)-mean(~Distance, data=case0701))^2)

## ----fig.width=6, fig.height=4.5-----------------------------------------
xyplot(Distance ~ Velocity, panel=panel.lmbands, data=case0701)

## ------------------------------------------------------------------------
# linear regression with no intercept
lm2 = lm(Distance ~ Velocity-1, data=case0701)
summary(lm2)
confint(lm2)

## ------------------------------------------------------------------------
summary(case0702)

## ------------------------------------------------------------------------
logtime = log(case0702$Time)
xyplot(pH ~ logtime, data=case0702)

## ------------------------------------------------------------------------
lm3 = lm(pH ~ logtime, data=case0702)
summary(lm3)
beta0 = coef(lm3)["(Intercept)"]; beta0
beta1 = coef(lm3)["logtime"]; beta1
sigma = summary(lm3)$sigma; sigma

## ------------------------------------------------------------------------
mu = beta0+beta1*log(4); mu
n = nrow(case0702)
mean = mean(~logtime, data=case0702)
sd = sd(~logtime, data=case0702)
se = sigma*sqrt(1/n+(log(4)-mean)^2/((n-1)*sd)); se
upper = mu+qt(0.975, df=8)*se; upper
lower = mu-qt(0.975, df=8)*se; lower

## ------------------------------------------------------------------------
predict(lm3, interval="confidence")[5,]

## ------------------------------------------------------------------------
pred = beta0+beta1*log(4); pred
predse = sigma*sqrt(1+1/n+(log(4)-mean)^2/((n-1)*sd)); predse
predupper = pred+qt(0.975, df=8)*predse; predupper
predlower = pred-qt(0.975, df=8)*predse; predlower

## ----message=FALSE-------------------------------------------------------
predict(lm3, interval="prediction")[5,] 

## ----fig.width=8, fig.height=6, message=FALSE----------------------------
xyplot(pH ~ logtime, abline=(h=6), data=case0702, panel=panel.lmbands)

