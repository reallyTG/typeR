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
summary(case1101)

## ----fig.height=8, fig.width=8-------------------------------------------
xyplot(Metabol ~ Gastric | Sex+Alcohol, data=case1101, auto.key=TRUE,
  xlab="Gastric AD activity (mu mol/min/g of tissue)", 
  ylab="first pass metabolism (mmol/liter-hour)")

## ----display11.9---------------------------------------------------------
case1101 = transform(case1101, Sex = factor(Sex, levels = c("Male", "Female")))
case1101 = transform(case1101, Alcohol = factor(Alcohol, levels = c("Non-alcoholic", "Alcoholic")))
lm1 = lm(Metabol ~ Gastric+Sex+Alcohol+Gastric*Sex+Sex*Alcohol+Gastric*Alcohol+Gastric*Sex*Alcohol, data=case1101); summary(lm1)

## ----message=FALSE-------------------------------------------------------
require(MASS)

## ------------------------------------------------------------------------
case1101 = transform(case1101, hat = hatvalues(lm1))
case1101 = transform(case1101, studres = studres(lm1))
case1101 = transform(case1101, cooks = cooks.distance(lm1))
# display a particular row
case1101[31,]

## ------------------------------------------------------------------------
plot(lm1, which=1)

## ------------------------------------------------------------------------
case11012 = case1101[-c(31, 32),]
lm2 = lm(Metabol ~ Gastric+Sex+Alcohol+Gastric*Sex+Sex*Alcohol+Gastric*Alcohol+Gastric*Sex*Alcohol, data=case11012); summary(lm2)

## ----lackoffit-----------------------------------------------------------
lm3 = lm(Metabol ~ Gastric+Sex+Gastric*Sex, data=case11012); summary(lm3)
anova(lm3, lm2) # page 322

## ----display11.14--------------------------------------------------------
lm4 = lm(Metabol ~  Gastric+Gastric:Sex - 1, data=case11012); summary(lm4)
anova(lm4, lm3)

## ----case1102------------------------------------------------------------
names(case1102)
case1102 = transform(case1102, Y = Brain/Liver)
case1102 = transform(case1102, logliver = log(Liver))
case1102 = transform(case1102, logbrain = log(Brain))
case1102 = transform(case1102, SAC = as.factor(Time))
case1102 = transform(case1102, logy = log(Brain/Liver))
case1102 = transform(case1102, logtime = log(Time))
case1102 = transform(case1102, Treat = relevel(Treatment, ref="NS"))
summary(case1102)

## ----fig.height=10, fig.width=10-----------------------------------------
smallds = subset(case1102, select=c("logy", "logbrain","logliver","Treat", "SAC"))
pairs(smallds)

## ------------------------------------------------------------------------
xyplot(Y ~ Time, group=Treat, scales=list(y=list(log=TRUE), 
  x=list(log=TRUE)), auto.key=TRUE, data=case1102)

## ------------------------------------------------------------------------
case1102=transform(case1102, female = ifelse(Sex=="F", 1, 0))
xyplot(logy ~ jitter(female), xlab="Sex", data=case1102)

## ------------------------------------------------------------------------
xyplot(logy ~ jitter(Days), data=case1102)

## ----fullmodel-----------------------------------------------------------
lm1 = lm(logy ~ SAC+Treat+SAC*Treat+Days+Sex+ 
  Weight+Loss+Tumor, data=case1102); summary(lm1)

## ------------------------------------------------------------------------
plot(lm1, which=1)

## ----reducedmodel--------------------------------------------------------
lm2 = lm(logy ~ SAC+Treat, data=case1102); summary(lm2) 
anova(lm2, lm1)

