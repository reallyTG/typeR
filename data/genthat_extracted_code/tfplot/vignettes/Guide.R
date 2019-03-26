### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:10-11
###################################################
 options(continue="  ")


###################################################
### code chunk number 2: Guide.Stex:17-18
###################################################
library("tfplot")  


###################################################
### code chunk number 3: Guide.Stex:50-56
###################################################
 z  <- ts(cumsum(rnorm(200)), start=c(1990, 1), frequency=12) 
 x  <- ts(cumsum(rnorm(200)), start=c(1990, 1), frequency=12) 
 zz <- ts(apply(matrix(rnorm(600), 100,3),2, cumsum), 
           start=c(1990, 1), frequency=4) 
 xx <- ts(apply(matrix(rnorm(600), 100,3),2, cumsum), 
           start=c(1990, 1), frequency=4) 


###################################################
### code chunk number 4: Guide.Stex:61-62
###################################################
  tfplot(z)


###################################################
### code chunk number 5: Guide.Stex:67-68
###################################################
  tfplot(zz)


###################################################
### code chunk number 6: Guide.Stex:80-81
###################################################
  tfplot(z, x)


###################################################
### code chunk number 7: Guide.Stex:91-92
###################################################
  tfplot(zz, xx)


###################################################
### code chunk number 8: Guide.Stex:98-100
###################################################
  par(mfcol=c(1,1))
  tfOnePlot(zz)


###################################################
### code chunk number 9: Guide.Stex:103-104
###################################################
  tfOnePlot(tbind(z, x))


###################################################
### code chunk number 10: Guide.Stex:120-124
###################################################
  seriesNames(zz) <- c("Random I","Random II","Random III")
  tfplot(zz, Title="Randomly Generated Series", 
     start=c(2005,1), end=c(2012,4), lastObs=TRUE,
     source="Source: simulated data")


###################################################
### code chunk number 11: Guide.Stex:127-130
###################################################
  par(mfcol=c(1,1))
  tfOnePlot(zz, Title="Randomly Generated Series", subtitle="(cummulated)",
      legend=c("Random I", "Random II", "Random III"))


###################################################
### code chunk number 12: Guide.Stex:134-142
###################################################
  tfOnePlot(percentChange(zz), Title="Randomly Generated Series", 
      subtitle="(cummulated)",
      lty=c("solid", "dashed", "solid"), col=c("pink", "blue", "yellow"),
      legend=c("Random I", "Random II", "Random III"),
      ylab="Percent Change", xlab="Quarterly Series",
      ylim=c(-200, 300),
      source="Source: simulated data", 
      footnote="Left Note", footnoteRight ="Right Note")


###################################################
### code chunk number 13: Guide.Stex:151-159
###################################################
  tfplot(ytoypc(zz), annualizedGrowth(zz), 
      Title="Randomly Generated Series", 
      subtitle=c("Random I","Random II","Random III"),
      lty=c("solid", "solid"), 
      ylab=c("Annual Growth", "Annual Growth", "Annual Growth"), 
      xlab="year-to-year growth (black); annualized quarterly growth (red)",
      ylim=c(-200, 300),
      source="Source: simulated data")


###################################################
### code chunk number 14: Guide.Stex:165-174
###################################################
  tfplot(ytoypc(100+zz), annualizedGrowth(100+zz), 
      100 * diffLog(100+zz, lag=4), 400 * diffLog(100+zz, lag=1),
      Title="Difference of Log Approximates *Small* Growth Rates", 
      subtitle=c("100 + Random I","100 + Random II","100 + Random III"),
      lty=c("solid", "solid", "dashed", "dashed"),
      col=c("black", "red",   "green",  "blue"),
      ylab=c("Annual Growth", "Annual Growth", "Annual Growth"), 
      xlab="year-to-year growth (solid black); annualized quarterly growth (solid red); \
 100 * diff lag 4 of log (dashed green); 400 * diff lag 1 of log (dashed blue)")


###################################################
### code chunk number 15: Guide.Stex:181-182
###################################################
  tfplot(zz, xx, start=c(2014,1))


###################################################
### code chunk number 16: Guide.Stex:205-226
###################################################
  z  <- ts(cumsum(rnorm(200)), start=c(1990, 1), frequency=12) 
  x  <- ts(c(rep(NA,105),cumsum(rnorm(100)),rep(NA,10)),
                             start=c(1995, 1), frequency=12) 

  seriesNames(z) <- "z"
  seriesNames(x) <- "x"
 
  start(z)
  end(z)
  Tobs(z)
  tframe(z)

  start(x)
  end(x)
  Tobs(x)
  tframe(x)

  start(trimNA(x))
  end(trimNA(x))
  Tobs(trimNA(x))
  tframe(trimNA(x))


###################################################
### code chunk number 17: Guide.Stex:230-231
###################################################
  tfplot(z)


###################################################
### code chunk number 18: Guide.Stex:236-237
###################################################
  tfplot(x)


###################################################
### code chunk number 19: Guide.Stex:243-244
###################################################
  tfplot(x,z)


###################################################
### code chunk number 20: Guide.Stex:249-250
###################################################
  tfplot(x,z, start=c(2000,1))


###################################################
### code chunk number 21: Guide.Stex:254-255
###################################################
  tfplot(tbind(x,z))


###################################################
### code chunk number 22: Guide.Stex:261-262
###################################################
  tfplot(trimNA(tbind(x,z)))


###################################################
### code chunk number 23: Guide.Stex:272-273
###################################################
  tfplot(tbind(x,z), tf=tframe(x))


###################################################
### code chunk number 24: Guide.Stex:278-279
###################################################
  tfplot(tbind(x,z), tf=tframe(trimNA(x)))


