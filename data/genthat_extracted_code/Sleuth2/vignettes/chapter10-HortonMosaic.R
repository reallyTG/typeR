## ----pvalues, echo=FALSE, message=FALSE----------------------------------
print.pval = function(pval) {
  threshold = 0.0001
    return(ifelse(pval < threshold, paste("p<", sprintf("%.4f", threshold), sep=""),
                ifelse(pval > 0.1, paste("p=",round(pval, 2), sep=""),
                       paste("p=", round(pval, 3), sep=""))))
}

## ----setup0, include=FALSE, cache=FALSE----------------------------------
require(knitr)
opts_chunk$set(
  dev="pdf",
  fig.path="figures/",
        fig.height=3,
        fig.width=4,
        out.width=".67\\textwidth",
        fig.keep="high",
        fig.show="hold",
        fig.align="center",
        prompt=TRUE,  # show the prompts; but perhaps we should not do this 
        comment=NA    # turn off commenting of ouput (but perhaps we should not do this either
  )

## ----setup,echo=FALSE,message=FALSE--------------------------------------
require(Sleuth2)
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

## ----install_mosaic,eval=FALSE-------------------------------------------
## install.packages('mosaic')               # note the quotation marks

## ----load_mosaic,eval=FALSE----------------------------------------------
## require(mosaic)

## ----install_Sleuth2,eval=FALSE------------------------------------------
## install.packages('Sleuth2')               # note the quotation marks

## ----load_Sleuth2,eval=FALSE---------------------------------------------
## require(Sleuth2)

## ----eval=TRUE-----------------------------------------------------------
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
options(digits=3)

## ------------------------------------------------------------------------
summary(case1001)
favstats(~ Distance, data=case1001)

## ------------------------------------------------------------------------
xyplot(Distance ~ Height, data=case1001)

## ------------------------------------------------------------------------
lm1 = lm(Distance ~ Height+I(Height^2)+I(Height^3), data=case1001); summary(lm1)

## ------------------------------------------------------------------------
lm2 = lm(Distance ~ Height+I(Height^2), data=case1001); summary(lm2)

## ------------------------------------------------------------------------
lmpoly = lm(Distance ~ poly(Height, 2), data=case1001); summary(lmpoly)

## ------------------------------------------------------------------------
case1001 = transform(case1001, pred = predict(lm2))
xyplot(pred+Distance ~ Height, auto.key=TRUE, data=case1001)

## ------------------------------------------------------------------------
predict(lm2, interval="confidence", data.frame(Height=c(0, 250)))

## ------------------------------------------------------------------------
355.1+c(-1, 1)*6.62*qt(.975, 4)

## ------------------------------------------------------------------------
predict(lm2, interval="predict", data.frame(Height=c(0, 250)))

## ------------------------------------------------------------------------
anova(lm2)

## ------------------------------------------------------------------------
case1002 = transform(case1002, logmass = log(Mass))
case1002 = transform(case1002, logenergy = log(Energy))
summary(case1002)
favstats(Mass ~ Type, data=case1002)
favstats(Energy ~ Type, data=case1002)

## ----fig.height=4, fig.width=4,tidy=FALSE--------------------------------
xyplot(Energy ~ Mass, group=Type, scales=list(y=list(log=TRUE), 
    x=list(log=TRUE)), auto.key=TRUE, data=case1002)

## ------------------------------------------------------------------------
lm1 = lm(logenergy ~ logmass+Type, data=case1002); summary(lm1)

## ------------------------------------------------------------------------
confint(lm1)
exp(confint(lm1))

## ------------------------------------------------------------------------
summary(lm(logenergy ~ Type, data=case1002))
summary(lm(logenergy ~ Type * logmass, data=case1002))

## ------------------------------------------------------------------------
pred = predict(lm1, se.fit=TRUE, newdata=data.frame(Type=c("non-echolocating birds", "non-echolocating birds"), logmass=c(log(100), log(400))))
pred.fit = pred$fit[1]; pred.fit
pred.se = pred$se.fit[1]; pred.se
multiplier = sqrt(4*qf(.95, 4, 16)); multiplier
lower = exp(pred.fit-pred.se*multiplier); lower
upper = exp(pred.fit+pred.se*multiplier); upper 

# for the other reference points
pred2 = predict(lm1, se.fit=TRUE, newdata=data.frame(Type=c("non-echolocating bats", "non-echolocating bats"), logmass=c(log(100), log(400))))
pred3 = predict(lm1, se.fit=TRUE, newdata=data.frame(Type=c("echolocating bats", "echolocating bats"), logmass=c(log(100), log(400))))

table10.9 = rbind(c("Intercept estimate", "Standard error"), round(cbind(pred2$fit, pred2$se.fit), 4), round(cbind(pred3$fit, pred3$se.fit), 4)); table10.9

## ------------------------------------------------------------------------
lm2 = lm(logenergy ~ logmass, data=case1002)
anova(lm2, lm1)

## ------------------------------------------------------------------------
lm3 = lm(logenergy ~ logmass*Type, data=case1002)
anova(lm3, lm1)

## ------------------------------------------------------------------------
require(gmodels)
estimable(lm1, c(0, 0, -1, 1))

