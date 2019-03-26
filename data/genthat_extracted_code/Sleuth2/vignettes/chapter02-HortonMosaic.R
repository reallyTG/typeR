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

## ----pvalues, echo=FALSE, message=FALSE----------------------------------
print.pval = function(pval) {
  threshold = 0.0001
    return(ifelse(pval < threshold, paste("p<", sprintf("%.4f", threshold), sep=""),
                ifelse(pval > 0.1, paste("p=",round(pval, 2), sep=""),
                       paste("p=", round(pval, 3), sep=""))))
}

## ----setup,echo=FALSE,message=FALSE--------------------------------------
require(Sleuth2)
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

## ----install_Sleuth2,eval=FALSE------------------------------------------
## install.packages('Sleuth2')               # note the quotation marks

## ----load_Sleuth2,eval=FALSE---------------------------------------------
## require(Sleuth2)

## ----eval=TRUE-----------------------------------------------------------
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
options(digits=3, show.signif.stars=FALSE)

## ------------------------------------------------------------------------
summary(case0201)
fav=favstats(Humerus ~ Status, data=case0201); fav

## ------------------------------------------------------------------------
bwplot(Status ~ Humerus, data=case0201)

## ------------------------------------------------------------------------
densityplot(~ Humerus, groups=Status, auto.key=TRUE, data=case0201)

## ------------------------------------------------------------------------
# Calculate Pooled SD
n1 = fav["Perished", "n"]; n1
n2 = fav["Survived", "n"]; n2
s1 = fav["Perished", "sd"]; s1
s2 = fav["Survived", "sd"]; s2
Sp = sqrt(((n1-1)*(s1)^2+(n2-1)*(s2)^2)/(n1+n2-2)); Sp
# Calculate standard error
SE = Sp*sqrt(1/n1+1/n2); SE

## ------------------------------------------------------------------------
Y1 = fav["Perished", "mean"]; Y1
Y2 = fav["Survived", "mean"]; Y2
Yd = Y2-Y1; Yd
df = n1+n2-2; df
qt = qt(0.975, df); qt
hw = qt*SE; hw
lower = Yd-hw; lower
upper = Yd+hw; upper

## ------------------------------------------------------------------------
tstats = (Yd-0)/SE; tstats      # The hypothesis difference=0
onepval = 1-pt(tstats, df); onepval
twopval = 2*onepval; twopval

## ------------------------------------------------------------------------
t.test(Humerus ~ Status, var.equal=TRUE, data=case0201)
confint(lm(Humerus ~ Status, data=case0201))

## ------------------------------------------------------------------------
summary(case0202)

## ------------------------------------------------------------------------
DIFF = case0202[, "Unaffect"]-case0202[, "Affected"]
favstats(DIFF)

## ------------------------------------------------------------------------
densityplot(DIFF)

## ------------------------------------------------------------------------
# Calculate t-statistics
difmean = favstats(DIFF)[, "mean"]; difmean
difsd = favstats(DIFF)[, "sd"]; difsd
difSE = difsd/sqrt(15); difSE
tscore = (difmean-0)/difSE; tscore         # hypothesis difference=0
twopvalue = 2*(1-pt(tscore, 15-1)); twopvalue
# Construct confidence interval
q = qt(0.975, 15-1); q
schizolower = difmean-q*difSE; schizolower
schizoupper = difmean+q*difSE; schizoupper

## ------------------------------------------------------------------------
t.test(case0202[, "Unaffect"], case0202[, "Affected"], paired=TRUE)

