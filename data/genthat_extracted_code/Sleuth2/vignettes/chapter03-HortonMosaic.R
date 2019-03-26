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
trellis.par.set(theme=col.mosaic())  # get a better color scheme 
set.seed(123)
# this allows for code formatting inline.  Use \Sexpr{'function(x,y)'}, for exmaple.
knit_hooks$set(inline = function(x){
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
summary(case0301)
favstats(Rainfall ~ Treatment, data=case0301)

## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(Rainfall ~ Treatment, data=case0301)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~Rainfall, groups=Treatment, auto.key=TRUE, data=case0301)

## ------------------------------------------------------------------------
case0301 = transform(case0301, lograin=log(Rainfall))
favstats(lograin ~ Treatment, data=case0301)

## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(lograin ~ Treatment, data=case0301)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~lograin, groups=Treatment, auto.key=TRUE, data=case0301)

## ------------------------------------------------------------------------
t.test(Rainfall ~ Treatment, var.equal=FALSE, data=case0301)
t.test(Rainfall ~ Treatment, var.equal=TRUE, data=case0301)

## ------------------------------------------------------------------------
summary(lm(lograin ~ Treatment, data=case0301))
ttestlog = t.test(lograin ~ Treatment, data=case0301); ttestlog

## ------------------------------------------------------------------------
obslogdiff = -diff(mean(lograin ~ Treatment, data=case0301)); obslogdiff
multiplier = exp(obslogdiff); multiplier

## ------------------------------------------------------------------------
ttestlog$conf.int
exp(ttestlog$conf.int)

## ------------------------------------------------------------------------
summary(case0302)
favstats(Dioxin ~ Veteran, data=case0302)

## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(Veteran ~ Dioxin, data=case0302)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~Dioxin, groups=Veteran, auto.key=TRUE, data=case0302)

## ------------------------------------------------------------------------
t.test(Dioxin ~ Veteran, var.equal=TRUE, alternative="less", data=case0302)
t.test(Dioxin ~ Veteran, var.equal=TRUE, data=case0302)$conf.int

## ------------------------------------------------------------------------
case0302.2 = case0302[-c(646), ]
t.test(Dioxin ~ Veteran, alternative="less", data=case0302.2)

## ------------------------------------------------------------------------
dim(case0302)
case0302.3 = case0302[-c(645, 646), ]
dim(case0302.3)
t.test(Dioxin ~ Veteran, alternative="less", data=case0302.3)

