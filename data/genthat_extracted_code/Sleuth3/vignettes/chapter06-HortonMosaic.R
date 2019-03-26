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
options(digits=3)

## ------------------------------------------------------------------------
case0601$Handicap = relevel(case0601$Handicap, ref="Amputee")
summary(case0601)
favstats(Score ~ Handicap, data=case0601)

## ------------------------------------------------------------------------
with(subset(case0601, Handicap=="None"), stem(Score, scale=2))
with(subset(case0601, Handicap=="Amputee"), stem(Score, scale=2))
with(subset(case0601, Handicap=="Crutches"), stem(Score, scale=1))
with(subset(case0601, Handicap=="Hearing"), stem(Score, scale=2))
with(subset(case0601, Handicap=="Wheelchair"), stem(Score, scale=2))


## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(Handicap ~ Score, data=case0601)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~ Score, groups=Handicap, auto.key=TRUE, data=case0601)

## ------------------------------------------------------------------------
anova(lm(Score ~ Handicap, data=case0601))

## ------------------------------------------------------------------------
summary(lm(Score ~ Handicap, data=case0601))

## ------------------------------------------------------------------------
model.tables(aov(Score ~ Handicap, data=case0601))

## ------------------------------------------------------------------------
mean(Score ~ Handicap, data=case0601)-mean(~ Score, data=case0601)

## ------------------------------------------------------------------------
TukeyHSD(aov(lm(Score ~ Handicap, data=case0601)), "Handicap", ordered=TRUE, c(0,1,-1,0,0), conf.level=0.95)

## ----echo=FALSE----------------------------------------------------------
tuk = TukeyHSD(aov(lm(Score ~ Handicap, data=case0601)), "Handicap", ordered=TRUE, c(0,1,-1,0,0), conf.level=0.95)

## ------------------------------------------------------------------------
require(gmodels)
fit.contrast(lm(Score ~ Handicap, data=case0601), "Handicap", c(-1, 1, -1, 0, 1), conf.int=0.95)

## ------------------------------------------------------------------------
fit.contrast(lm(Score ~ Handicap, data=case0601), "Handicap", c(-0.5, 0.5, -0.5, 0, 0.5), conf.int=0.95)

## ------------------------------------------------------------------------
require(agricolae)
LSD.test(aov(lm(Score ~ Handicap, data=case0601)), "Handicap")   # LSD
HSD.test(aov(lm(Score ~ Handicap, data=case0601)), "Handicap")   # Tukey-Kramer
LSD.test(aov(lm(Score ~ Handicap, data=case0601)), "Handicap", p.adj=c("bonferroni"))  # Bonferroni
scheffe.test(aov(lm(Score ~ Handicap, data=case0601)), "Handicap")    # Scheffe

## ------------------------------------------------------------------------
summary(case0602)
favstats(Percentage ~ Pair, data=case0602)

## ----fig.height=8, fig.width=8-------------------------------------------
bwplot(Pair ~ Percentage, data=case0602)

## ----fig.height=8, fig.width=8-------------------------------------------
densityplot(~ Percentage, groups=Pair, auto.key=TRUE, data=case0602)

## ------------------------------------------------------------------------
anova(lm(Percentage ~ Pair, data=case0602))

## ------------------------------------------------------------------------
summary(lm(Percentage ~ Pair, data=case0602))

## ------------------------------------------------------------------------
model.tables(aov(Percentage ~ Pair, data=case0602))

## ------------------------------------------------------------------------
mean(Percentage ~ Pair, data=case0602)-mean(~ Percentage, data=case0602)

## ------------------------------------------------------------------------
require(gmodels)
lc = fit.contrast(lm(Percentage ~ Pair, data=case0602), "Pair", c(5, -3, 1, 3, -9, 3), conf.int=0.95); lc
t=round(lc[, "t value"], 2); t
pt(t, 78, lower.tail=TRUE)

## ------------------------------------------------------------------------
mean(mean(Percentage ~ Pair, data=case0602))
t.test(mean(Percentage ~ Pair, data=case0602))

