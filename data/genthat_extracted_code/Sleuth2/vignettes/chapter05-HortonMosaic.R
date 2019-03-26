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

## ----eval=FALSE----------------------------------------------------------
## trellis.par.set(theme=col.mosaic())  # get a better color scheme
## options(digits=3)
## 

## ------------------------------------------------------------------------
summary(case0501)
favstats(Lifetime ~ Diet, data=case0501)

## ------------------------------------------------------------------------
bwplot(Lifetime ~ Diet, data=case0501) # Display 5.1

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~ Lifetime, groups=Diet, auto.key=TRUE, data=case0501)

## ----eval=TRUE-----------------------------------------------------------
anova(lm(Lifetime ~ Diet, data=case0501))

## ------------------------------------------------------------------------
summary(lm(Lifetime ~ Diet, data=case0501))

## ----a-------------------------------------------------------------------
require(gmodels)
# N/N85 vs N/R50
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(0, -1, 0, 1, 0, 0), conf.int=0.95)

## ----b-------------------------------------------------------------------
# N/R50 vs R/R50 (b)
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(0, 0, 0, -1, 1, 0), conf.int=0.95)

## ----c-------------------------------------------------------------------
# N/R40 vs N/R50 (c)
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(0, 0, 0, -1, 0, 1), conf.int=0.95)
# N/N85 vs N/R40
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(0, -1, 0, 0, 0, 1), conf.int=0.95)

## ----d-------------------------------------------------------------------
# N/R50 vs N/R50 lopro (d)
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(0, 0, 1, -1, 0, 0), conf.int=0.95)

## ----e-------------------------------------------------------------------
# N/N85 vs NP (e)
fit.contrast(lm(Lifetime ~ Diet, data=case0501), "Diet", c(-1, 1, 0, 0, 0, 0), conf.int=0.95)

## ------------------------------------------------------------------------
model.tables(aov(lm(Lifetime ~ Diet, data=case0501)))

## ------------------------------------------------------------------------
mean(Lifetime ~ Diet, data=case0501)-mean(~ Lifetime, data=case0501)

## ------------------------------------------------------------------------
df = length(case0501$Diet) - length(unique(case0501$Diet)); df
sdvals = with(case0501, tapply(Lifetime, Diet, sd)); sdvals
nvals = with(case0501, tapply(Lifetime, Diet, length)); nvals
pooledsd = sum(sdvals*nvals)/sum(nvals); pooledsd

## ----fig.height=8, fig.width=8-------------------------------------------
aov1 = aov(lm(Lifetime ~ Diet, data=case0501))
plot(aov1, which=1) 

## ----fig.height=8, fig.width=8-------------------------------------------
plot(aov1, which=2)
plot(aov1, which=3)

## ------------------------------------------------------------------------
summary(case0502)
case0502$Judge = with(case0502, as.factor(Judge))
favstats(Percent ~ Judge, data=case0502)

## ------------------------------------------------------------------------
bwplot(Percent ~ Judge, data=case0502) # Display 5.5 (page 118)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~ Percent, groups=Judge, auto.key=TRUE, data=case0502)

## ------------------------------------------------------------------------
aov1 = anova(lm(Percent ~ Judge, data=case0502)); aov1 

## ------------------------------------------------------------------------
summary(lm(Percent ~ Judge, data=case0502))

## ------------------------------------------------------------------------
model.tables(aov(lm(Percent ~ Judge, data=case0502)))

## ------------------------------------------------------------------------
with(subset(case0502, Judge!="Spock's"), anova(lm(Percent ~ Judge)))

## ------------------------------------------------------------------------
case0502$twoJudge = as.character(case0502$Judge)
case0502$twoJudge[case0502$Judge!="Spock's"] = "notspock"
tally(twoJudge ~ Judge, format="count", data=case0502)


## ------------------------------------------------------------------------
numdf1 = aov1["Residuals", "Df"]; numdf1 # Within
ss1 = aov1["Residuals", "Sum Sq"]; ss1 # Within
aov2 = anova(lm(Percent ~ as.factor(twoJudge), data=case0502)); aov2
df2 = aov2["Residuals", "Df"]; df2 # Spock and others 
ss2 = aov2["Residuals", "Sum Sq"]; ss2 # Spock and others 
Fstat = ((ss2 - ss1)/(df2 - numdf1)) / (ss1 / numdf1); Fstat 
1-pf(Fstat, length(levels(case0502$Judge))-2, numdf1)

## ------------------------------------------------------------------------
anova(lm(Percent ~ as.factor(twoJudge), data=case0502), lm(Percent ~ as.factor(Judge), data=case0502))

## ------------------------------------------------------------------------
# test all of the other judges vs. Spock's judge using a contrast page 118
fit.contrast(lm(Percent ~ Judge, data=case0502), "Judge", c(-6, 1, 1, 1, 1, 1, 1), conf.int=0.95)

# calculate the 95% confidence interval for Dr. Spock's jury female composition page 118
estimable(lm(Percent ~ Judge, data=case0502), c(1,0,0,0,0,0,0), conf.int=0.95)

## ------------------------------------------------------------------------
kruskal.test(Percent ~ Judge, data=case0502)

