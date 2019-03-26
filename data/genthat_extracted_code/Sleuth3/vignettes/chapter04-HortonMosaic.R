## ----setup, include=FALSE, cache=FALSE-----------------------------------
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

## ----pvalues, echo=FALSE, message=FALSE----------------------------------
print.pval = function(pval) {
  threshold = 0.0001
    return(ifelse(pval < threshold, paste("p<", sprintf("%.4f", threshold), sep=""),
                ifelse(pval > 0.1, paste("p=",round(pval, 2), sep=""),
                       paste("p=", round(pval, 3), sep=""))))
}

## ----setup2,echo=FALSE,message=FALSE-------------------------------------
require(Sleuth3)
require(mosaic)
trellis.par.set(theme=col.mosaic())  # get a better color scheme 
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

## ----install_Sleuth3,eval=FALSE------------------------------------------
## install.packages('Sleuth3')               # note the quotation marks

## ----load_Sleuth3,eval=FALSE---------------------------------------------
## require(Sleuth3)

## ----eval=TRUE-----------------------------------------------------------
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
options(digits=3, show.signif.stars=FALSE)

## ------------------------------------------------------------------------
summary(case0401)
favstats(Incidents ~ Launch, data=case0401)

## ------------------------------------------------------------------------
histogram(~ Incidents | Launch, data=case0401)

## ------------------------------------------------------------------------
t.test(Incidents ~ Launch, var.equal=TRUE, data=case0401)

## ------------------------------------------------------------------------
C244=factorial(24)/(factorial(4)*factorial(24-4)); C244

## ------------------------------------------------------------------------
# t.test for (1, 1, 2, 3)   # observations 1, 2, 4 and 24
case0401$Incidents[c(1,2,4,24)]
with(case0401, t.test(Incidents[c(1,2,4,24)], Incidents[-c(1,2,4,24)], var.equal=TRUE))
# t.test for (0, 1, 2, 3)   # observation 1, 4, 5 and 24 
case0401$Incidents[c(1,4,5,24)]
with(case0401, t.test(Incidents[c(1,4,5,24)], Incidents[-c(1,4,5,24)], var.equal=TRUE))

## ------------------------------------------------------------------------
C1113 = factorial(5)/(factorial(3)*factorial(5-3))*1; C1113

## ------------------------------------------------------------------------
C1123 = factorial(5)/(factorial(2)*factorial(5-2))*1*1; C1123

## ------------------------------------------------------------------------
C0123 = 17*5*1*1; C0123

## ------------------------------------------------------------------------
onep = (C1113+C1123+C0123)/C244; onep

## ----fig.height=8, fig.width=8-------------------------------------------
result = t.test(Incidents ~ Launch, var.equal=TRUE, data=case0401)$statistic; result
nulldist = do(10000)*t.test(Incidents ~ shuffle(Launch), var.equal=TRUE, data=case0401)$statistic
histogram(~ t, groups=t >= result, v=result, data=nulldist)
tally(~ t >= result, format="proportion", data=nulldist)

## ------------------------------------------------------------------------
summary(case0402)
favstats(Time ~ Treatment, data=case0402)

## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(Treatment ~ Time, data=case0402)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~ Time, groups=Treatment, auto.key=TRUE, data=case0402)

## ------------------------------------------------------------------------
obsrank = rank(case0402$Time, ties.method="average"); obsrank
mt = sum(obsrank[1:14]); mt

## ------------------------------------------------------------------------
average = mean(obsrank); average
sd = sd(obsrank); sd
n = nrow(subset(case0402, Treatment=="Modified")); n
MEANT = n * average; MEANT
SDT = sd * sqrt((n^2)/(2*n)); SDT
z = (mt-MEANT)/SDT; z
p = pnorm(-abs(z)); p

## ------------------------------------------------------------------------
wilcox.test(Time ~ Treatment, conf.int=TRUE, exact=TRUE, data=case0402)

