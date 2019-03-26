## ----setup0, include=FALSE, cache=FALSE----------------------------------
require(knitr)
opts_chunk$set(
  dev="pdf",
  fig.path="figures/",
        fig.height=4.5,
        fig.width=6,
        out.width=".77\\textwidth",
        fig.keep="high",
        fig.show="hold",
        fig.align="center",
        prompt=TRUE,  # show the prompts; but perhaps we should not do this 
        comment=NA    # turn off commenting of ouput (but perhaps we should not do this either)
)
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

## ----pvalues, echo=FALSE, message=FALSE----------------------------------
print.pval = function(pval) {
  threshold = 0.0001
    return(ifelse(pval < threshold, paste("p<", sprintf("%.4f", threshold), sep=""),
                ifelse(pval > 0.1, paste("p=",round(pval, 2), sep=""),
                       paste("p=", round(pval, 3), sep=""))))
}

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
summary(case1201)

## ------------------------------------------------------------------------
pairs(~ Takers+Rank+Years+Income+Public+Expend+SAT, data=case1201)

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

## ----fig.height=8, fig.width=8-------------------------------------------
pairs(~ Takers+Rank+Years+Income+Public+Expend+SAT, 
      lower.panel=panel.smooth, diag.panel=panel.hist, 
      upper.panel=panel.lm, data=case1201)

## ----message=FALSE, fig.height=8, fig.width=8,tidy=FALSE-----------------
require(car)
scatterplotMatrix(~ Takers+Rank+Years+Income+Public+Expend+SAT, 
  diagonal="histogram", smooth=FALSE, data=case1201)

## ------------------------------------------------------------------------
lm1 = lm(SAT ~ Rank+log(Takers), data=case1201)
summary(lm1)

## ----fig.width=6, fig.height=5-------------------------------------------
lm2 = lm(SAT ~ log2(Takers)+Income+Years+Public+Expend+Rank, data=case1201)
summary(lm2)
plot(lm2, which=4) 

## ----fig.width=5, fig.height=5-------------------------------------------
case1201r = case1201[-c(29),]
lm3 = lm(SAT ~ log2(Takers) + Income+ Years + Public + Expend + Rank, data=case1201r)
anova(lm3)
crPlots(lm2, term = ~ Expend) # with Alaska
crPlots(lm3, term = ~ Expend) # without Alaska

## ----tidy=FALSE----------------------------------------------------------
# Forward Selection
lm4 = lm(SAT ~ log2(Takers), data=case1201r)
stepAIC(lm4, scope=list(upper=lm3, lower=~1), direction="forward", 
  trace=FALSE)$anova
# Backward Elimination
stepAIC(lm3, direction="backward", trace=FALSE)$anova
# Stepwise Regression
stepAIC(lm3, direction="both", trace=FALSE)$anova

## ------------------------------------------------------------------------
lm5 = lm(SAT ~ log2(Takers) + Expend + Years + Rank, data=case1201r)
summary(lm5)

## ------------------------------------------------------------------------
sigma5 = summary(lm5)$sigma^2 # sigma-squared of chosen model
sigma3 = summary(lm3)$sigma^2 # sigma-squared of full model
n = 49 # sample size
p = 4+1 # number of coefficients in model
Cp=(n-p)*sigma5/sigma3+(2*p-n)
Cp

## ----fig.width=6, fig.height=5, message=FALSE----------------------------
require(leaps)
explanatory = with(case1201r, cbind(log(Takers), Income, Years, Public, Expend, Rank))
with(case1201r, leaps(explanatory, SAT, method="Cp"))$which[27,]

## ------------------------------------------------------------------------
with(case1201r, leaps(explanatory, SAT, method="Cp"))$Cp[27]

## ----fig.width=6, fig.height=4-------------------------------------------
plot(lm5, which=1)

## ------------------------------------------------------------------------
lm7 = lm(SAT ~ Expend, data=case1201r)
summary(lm7)
lm8 = lm(SAT ~ Income + Expend, data=case1201r)
summary(lm8)

## ------------------------------------------------------------------------
summary(case1202)

## ----echo=FALSE----------------------------------------------------------
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

## ----fig.height=8, fig.width=8-------------------------------------------
pairs(~ Bsal+Sex+Senior+Age+Educ+Exper+log(Bsal), 
      lower.panel=panel.smooth, diag.panel=panel.hist, 
      upper.panel=panel.lm, data=case1202)

## ----fig.width=6, fig.height=5, message=FALSE----------------------------
require(leaps)
explanatory1 = with(case1202, cbind(Senior, Age, Educ, Exper, Senior*Educ, Age*Educ, Age*Exper))
# First model (saexnck)
with(case1202, leaps(explanatory1, log(Bsal), method="Cp"))$which[55,]
with(case1202, leaps(explanatory1, log(Bsal), method="Cp"))$Cp[55]
# second model (saexck)
with(case1202, leaps(explanatory1, log(Bsal), method="Cp"))$which[49,]
with(case1202, leaps(explanatory1, log(Bsal), method="Cp"))$Cp[49]

## ------------------------------------------------------------------------
BIC(lm(log(Bsal) ~ Senior+Age+Educ+Exper+Age*Educ+Age*Exper, data=case1202))
BIC(lm(log(Bsal) ~ Senior+Age+Educ+Exper+(Exper)^2+Age*Educ, data=case1202))

## ------------------------------------------------------------------------
lm1 = lm(log(Bsal) ~ Senior + Age + Educ + Exper + Age*Educ + Age*Exper, data=case1202)
summary(lm1)

## ------------------------------------------------------------------------
lm2 = lm(log(Bsal) ~ Senior + Age + Educ + Exper + Age*Educ + Age*Exper + Sex, data=case1202)
summary(lm2)

