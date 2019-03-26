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
        out.width=".47\\textwidth",
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
options(digits=4)

## ------------------------------------------------------------------------
case0801
summary(case0801)

## ----fig.height=6, fig.width=10------------------------------------------
xyplot(Species ~ Area, pch=23, cex=2, data=case0801)

## ----fig.height=4, fig.width=6-------------------------------------------
densityplot(~ residuals(lm(Species ~ Area, data=case0801)), xlab="Residuals")
densityplot(~ Area, data=case0801)

## ------------------------------------------------------------------------
case0801 = transform(case0801, logarea = log(Area))
case0801 = transform(case0801, logspecies = log(Species))

## ----fig.height=4, fig.width=8-------------------------------------------
xyplot(logspecies ~ logarea, type = c("p", "r"), pch=23, cex=2, data=case0801)

## ------------------------------------------------------------------------
lm1 = lm(logspecies ~ logarea, data=case0801)
summary(lm1)

## ------------------------------------------------------------------------
confint(lm1)

## ------------------------------------------------------------------------
2^confint(lm1)

## ----fig.height=4, fig.width=6-------------------------------------------
plot(lm1, which=2)
plot(lm1, which=1)

## ------------------------------------------------------------------------
summary(case0802)

## ----fig.height=4, fig.width=6-------------------------------------------
histogram(~ Time, type='density', density=TRUE, nint=10, data=case0802)

## ----fig.height=4, fig.width=6-------------------------------------------
case0802$logtime=with(case0802, log(Time))
histogram(~ logtime, type='density', density=TRUE, nint=10, data=case0802)

## ----fig.height=6, fig.width=10------------------------------------------
histogram(~ Voltage, type='density', density=TRUE, nint=10, data=case0802)

## ----fig.height=6, fig.width=10------------------------------------------
xyplot(logtime ~ Voltage, data=case0802)

## ------------------------------------------------------------------------
lm1 = lm(logtime ~ Voltage, data=case0802)
summary(lm1)

## ------------------------------------------------------------------------
exp(coef(lm1))

## ------------------------------------------------------------------------
confint(lm1)

## ------------------------------------------------------------------------
exp(confint(lm1))

## ------------------------------------------------------------------------
anova(lm1)

## ------------------------------------------------------------------------
lm2 = lm(logtime ~ as.factor(Voltage), data=case0802)
summary(lm2)

## ------------------------------------------------------------------------
anova(lm2)

## ------------------------------------------------------------------------
anova(lm1, lm2)

## ----fig.height=4, fig.width=6-------------------------------------------
plot(lm1, which=2)
plot(lm1, which=1)

## ----fig.height=4, fig.width=6-------------------------------------------
case0802$sqrttime = with(case0802, sqrt(Time))
xyplot(sqrttime ~ Voltage, type=c("p", "r"), data=case0802)

## ----fig.height=4, fig.width=6-------------------------------------------
lm3 = lm(sqrttime ~ Voltage, data=case0802)
summary(lm3)
plot(lm3, which = 1)

