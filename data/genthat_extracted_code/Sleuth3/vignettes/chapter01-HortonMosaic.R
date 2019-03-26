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
require(mosaic)
require(Sleuth3)
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

## ----install_Sleuth3,eval=FALSE------------------------------------------
## install.packages('Sleuth3')               # note the quotation marks

## ----load_Sleuth3,eval=FALSE---------------------------------------------
## require(Sleuth3)

## ----eval=TRUE-----------------------------------------------------------
trellis.par.set(theme=col.mosaic())  # get a better color scheme for lattice
options(digits=3)

## ------------------------------------------------------------------------
summary(case0101)

## ----eval=TRUE-----------------------------------------------------------
favstats(Score ~ Treatment, data=case0101)
histogram(~ Score | Treatment, data=case0101)

## ------------------------------------------------------------------------
with(subset(case0101, Treatment=="Extrinsic"), stem(Score, scale=5))
with(subset(case0101, Treatment=="Intrinsic"), stem(Score, scale=5))

## ----eval=FALSE----------------------------------------------------------
## maggregate(Score ~ Treatment, data=case0101, FUN=stem)

## ----eval=TRUE-----------------------------------------------------------
t.test(Score ~ Treatment, alternative="two.sided", data=case0101)

## ----eval=TRUE-----------------------------------------------------------
summary(lm(Score ~ Treatment, data=case0101))

## ----eval=TRUE-----------------------------------------------------------
diffmeans = diff(mean(Score ~ Treatment, data=case0101))
diffmeans     # observed difference
numsim = 1000     # set to a sufficient number
nulldist = do(numsim)*diff(mean(Score~shuffle(Treatment), data=case0101))
confint(nulldist)
# Display 1.8 Sleuth
histogram(~ Intrinsic, nint=50, data=nulldist, v=c(-4.14,4.14))

## ----eval=TRUE-----------------------------------------------------------
summary(case0102) # Display 1.3 Sleuth p4

## ----eval=TRUE-----------------------------------------------------------
favstats(Salary ~ Sex, data=case0102)
bwplot(Salary ~ Sex, data=case0102)
densityplot(~ Salary, groups=Sex, auto.key=TRUE, data=case0102)

## ------------------------------------------------------------------------
histogram(rnorm(1000))  # Normal
histogram(rexp(1000))   # Long-tailed
histogram(runif(1000))  # Short-tailed
histogram(rchisq(1000, df=15)) # Skewed

## ----eval=TRUE-----------------------------------------------------------
t.test(Salary ~ Sex, var.equal=TRUE, data=case0102)

## ----obsdiff,eval=TRUE---------------------------------------------------
obsdiff = diff(mean(Salary ~ Sex, data=case0102)); obsdiff

## ----permutetest---------------------------------------------------------
numsim = 1000
res = do(numsim) * diff(mean(Salary~shuffle(Sex), data=case0102))
densityplot(~ Male, data=res)
confint(res)

## ----eval=FALSE----------------------------------------------------------
## larger = sum(with(res, abs(Male) >= abs(obsdiff)))
## larger
## pval = larger/numsim
## pval

## ----eval=TRUE-----------------------------------------------------------
t.test(Salary ~ Sex, alternative="less", data=case0102)

