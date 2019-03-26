library(HH)


### Name: cp.calc
### Title: Rearranges and improves the legibility of the output from the
###   stepwise function in S-Plus.
### Aliases: cp.calc print.cp.object [.cp.object
### Keywords: regression

### ** Examples

## This example is from Section 9.15 of Heiberger and Holland (2004).
data(usair)
if.R(s={usair <- usair}, r={})

splom(~usair, main="U.S. Air Pollution Data with SO2 response", cex=.5)
## export.eps(hh("regb/figure/regb.f1.usair.eps"))

usair$lnSO2 <- log(usair$SO2)
usair$lnmfg <- log(usair$mfgfirms)
usair$lnpopn <- log(usair$popn)

usair[1:3,]   ## lnSO2 is in position 8, SO2 is in position 1
              ## lnmfg is in position 9, lnpopn is in position 10

splom(~usair[, c(8,2,9,10,5:7)],
              main="U.S. Air Pollution Data with 3 log-transformed variables",
              cex=.5)
## export.eps(hh("regb/figure/regb.f2.usair.eps"))

if.R(s={
  usair.step <- stepwise(y=usair$lnSO2,
                         x=usair[, c(2,9,10,5:7)],
                         method="exhaustive",
                         plot=FALSE, nbest=2)
  ## print for pedagogical purposes only.  The plot of cp ~ p is more useful.
  ## The line with rss=1e35 is a stepwise() bug, that we reported to S-Plus.
  print(usair.step, digits=4)
  usair.cp <- cp.calc(usair.step, usair, "lnSO2")
  ## print for pedagogical purposes only.  The plot of cp ~ p is more useful.
  usair.cp
  tmp <- (usair.cp$cp <= 10)
  usair.cp[tmp,]

  old.par <- par(mar=par()$mar+c(0,1,0,0))
  tmp <- (usair.cp$cp <= 10)
  plot(cp ~ p, data=usair.cp[tmp,], ylim=c(0,10), type="n", cex=1.3)
  abline(b=1)
  text(x=usair.cp$p[tmp], y=usair.cp$cp[tmp],
       row.names(usair.cp)[tmp], cex=1.3)
  title(main="Cp plot for usair.dat, Cp<10")
  par(old.par)
## export.eps(hh("regb/figure/regb.f3.usair.eps"))
},r={
  usair.regsubset <- leaps::regsubsets(lnSO2~lnmfg+lnpopn+precip+raindays+temp+wind,
                                       data=usair, nbest=2)
  usair.subsets.Summary <- summaryHH(usair.regsubset)
  tmp <- (usair.subsets.Summary$cp <= 10)
  usair.subsets.Summary[tmp,]
  plot(usair.subsets.Summary[tmp,], statistic='cp', legend=FALSE)

  usair.lm7 <- lm.regsubsets(usair.regsubset, 7)
  anova(usair.lm7)
  summary(usair.lm7)
})

vif(lnSO2 ~ temp + lnmfg + lnpopn + wind + precip + raindays, data=usair)

vif(lnSO2 ~ temp + lnmfg + wind + precip, data=usair)

usair.lm <- lm(lnSO2 ~ temp + lnmfg + wind + precip, data=usair)
anova(usair.lm)
summary(usair.lm, corr=FALSE)



