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
        out.width=".72\\textwidth",
        fig.keep="high",
        fig.show="hold",
        fig.align="center",
        prompt=TRUE,  # show the prompts; but perhaps we should not do this 
        comment=NA    # turn off commenting of ouput (but perhaps we should not do this either
  )

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
options(digits=3)

## ------------------------------------------------------------------------
summary(case0901)
favstats(Flowers ~ Intens | Time, data=case0901)

## ----tidy=FALSE----------------------------------------------------------
xyplot(Flowers ~ Intens, groups=Time, type=c("p", "r", "smooth"), 
       data=case0901, auto.key=TRUE, 
       xlab="light intensity (mu mol/m^2/sec)", ylab="average number of flowers")

## ------------------------------------------------------------------------
lm1 = lm(Flowers ~ Intens+Time, data=case0901)
summary(lm1)
confint(lm1, level=.95) # 95% confidence intervals  

## ------------------------------------------------------------------------
lm2 = lm(Flowers ~ Intens*Time, data=case0901)
summary(lm2)

## ------------------------------------------------------------------------
case0902 = transform(case0902, logbrain = log(Brain))
case0902 = transform(case0902, logbody = log(Body))
case0902 = transform(case0902, loggest = log(Gestation))
case0902 = transform(case0902, loglitter = log(Litter))
summary(case0902)

## ----fig.height=8, fig.width=8-------------------------------------------
pairs(case0902[c("Brain", "Body", "Gestation", "Litter")])

## ------------------------------------------------------------------------
  panel.hist = function(x, ...)
  {
    usr = par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h = hist(x, plot=FALSE)
    breaks = h$breaks; nB = length(breaks)
    y = h$counts; y = y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
  }

panel.lm = function(x, y, col=par("col"), bg=NA, 
                    pch=par("pch"), cex=1, col.lm="red", ...) 
{
  points(x, y, pch=pch, col=col, bg=bg, cex=cex)
  ok = is.finite(x) & is.finite(y)
  if (any(ok)) 
    abline(lm(y[ok] ~ x[ok]))
}

## ----tidy=FALSE,fig.height=9, fig.width=9--------------------------------
  pairs(~ Brain+Body+Gestation+Litter, 
        lower.panel=panel.smooth, diag.panel=panel.hist, 
        upper.panel=panel.lm, data=case0902)

## ----tidy=FALSE, fig.height=9, fig.width=9-------------------------------
  pairs(~ logbrain+logbody+loggest+loglitter, 
              lower.panel=panel.smooth, diag.panel=panel.hist, 
              upper.panel=panel.lm, data=case0902)

## ----fig.height=6, fig.width=8-------------------------------------------
  xyplot(logbrain ~ jitter(loglitter), data=case0902)

## ----fig.height=8, fig.width=8-------------------------------------------
  xyplot(Brain ~ jitter(Litter), scales=list(y=list(log=TRUE),
                                             x=list(log=TRUE)), data=case0902)

## ----tidy=FALSE,fig.height=6, fig.width=10-------------------------------
case0902$weightcut = cut(case0902$Body, breaks=c(0, 2.1, 9.1, 100, 4200), 
  labels=c("Body Weight: 0kg to 2.1kg","Body Weight: 2.1kg to 9.1kg", 
  "Body Weight: 9.1kg to 100kg", "Body Weight: 100 to 4,200"))
xyplot(Brain ~ jitter(Litter) | weightcut, 
   scales=list(y=list(log=TRUE), x=list(log=TRUE)), type=c("p", "r"), 
   data=case0902)

## ------------------------------------------------------------------------
lm1 = lm(logbrain ~ logbody+loggest+loglitter, data=case0902)
summary(lm1)

