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
        out.width=".57\\textwidth",
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
options(digits=4, show.signif.stars=FALSE)

## ------------------------------------------------------------------------
# logit transformation
case1301 = transform(case1301, logitcover = log(Cover/(100-Cover)))

## ------------------------------------------------------------------------
summary(case1301)
favstats(logitcover~Treat, data=case1301)

## ----fig.height=8, fig.width=8-------------------------------------------
with(case1301, interaction.plot(Block, Treat, Cover))

## ----fig.height=8, fig.width=8-------------------------------------------
plot(aov(Cover ~ Block*Treat, data=case1301), which=1)

## ----fig.height=8, fig.width=8-------------------------------------------
with(case1301, interaction.plot(Block, Treat, logitcover))

## ------------------------------------------------------------------------
anova(lm(logitcover ~ Block*Treat, data=case1301))

## ------------------------------------------------------------------------
anova(lm(logitcover ~ Block+Treat, data=case1301))

## ----fig.height=8, fig.width=8-------------------------------------------
plot(aov(logitcover ~ Block+Treat, data=case1301), which=1)

## ----fig.height=8, fig.width=8, message=FALSE----------------------------
case1301$resid = residuals(aov(logitcover ~ Block+Treat, data=case1301))
histogram(~ resid, type='density', density=TRUE, data=case1301)

## ----fig.height=8, fig.width=8-------------------------------------------
plot(aov(logitcover ~ Block+Treat, data=case1301), which=3)

## ----fig.height=8, fig.width=8-------------------------------------------
plot(aov(logitcover ~ Block+Treat, data=case1301), which=4)

## ------------------------------------------------------------------------
case1301[c(13, 22, 87),]

## ------------------------------------------------------------------------
model.tables(aov(lm(logitcover ~ Block*Treat, data=case1301)), type="effects")

## ------------------------------------------------------------------------
model.tables(aov(lm(logitcover ~ Block*Treat, data=case1301)), type="means")

## ------------------------------------------------------------------------
require(gmodels)
lm1 = lm(logitcover ~ Treat+Block, data=case1301); coef(lm1)
large = rbind('Large fish' = c(0, -1/2, 1/2, 0, -1/2, 1/2))
small = rbind('Small fish' = c(-1/2, 1/2, 0, -1/2, 1/2, 0))
limpets = rbind('Limpets' = c(-1/3, -1/3, -1/3, 1/3, 1/3, 1/3))
limpetsSmall = rbind('Limpets X Small' = c(1, -1/2, -1/2, -1, 1/2, 1/2))
limpetsLarge = rbind('Limpets X Large' = c(0, 1, -1, 0, -1, 1))
fit.contrast(lm1, "Treat", large, conf.int=.95)
fit.contrast(lm1, "Treat", small, conf.int=.95) 
fit.contrast(lm1, "Treat", limpets, conf.int=.95)
fit.contrast(lm1, "Treat", limpetsSmall, conf.int=.95) 
fit.contrast(lm1, "Treat", limpetsLarge, conf.int=.95)

## ------------------------------------------------------------------------
summary(case1302)
case1302$newTreat = relevel(case1302$Treat, ref="Control")

## ----fig.height=8, fig.width=8-------------------------------------------
with(case1302, interaction.plot(Company, newTreat, Score))

## ------------------------------------------------------------------------
lm1 = lm(Score ~ Company*newTreat, data=case1302); summary(lm1)
lm2 = lm(Score ~ Company+newTreat, data=case1302); summary(lm2) # Display 13.18 page 395
anova(lm1)
anova(lm2)
anova(lm2, lm1)

## ----fig.height=8, fig.width=8-------------------------------------------
plot(lm2, which=1)

## ----tidy=FALSE----------------------------------------------------------
mod = lm(Score ~ Company+newTreat, data=case1302)
obs = summary(mod)$coefficients["newTreatPygmalion", "t value"]
obs
nulldist = do(10000) * summary(lm(Score ~ shuffle(Company)+shuffle(newTreat), 
  data=case1302))$coefficients["shuffle(newTreat)Pygmalion", "t value"]
histogram(~ result, groups=result >= obs, v=obs, data=nulldist) 
# akin to Display 13.20 page 398
tally(~ result >= obs, format="proportion", data=nulldist)

