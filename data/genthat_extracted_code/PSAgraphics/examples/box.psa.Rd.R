library(PSAgraphics)


### Name: box.psa
### Title: Compare balance graphically of a continuous covariate as part of
###   a PSA
### Aliases: box.psa
### Keywords: hplot htest

### ** Examples
 
continuous<-rnorm(1000)
treatment<-sample(c(0,1),1000,replace=TRUE)
strata<-sample(5,1000,replace=TRUE)
box.psa(continuous, treatment, strata)

data(lindner)
attach(lindner)
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
ps<-lindner.ps$fitted
lindner.s5 <- as.numeric(cut(ps, quantile(ps, seq(0, 1, 1/5)),
      include.lowest = TRUE, labels = FALSE))
box.psa(ejecfrac, abcix, lindner.s5, xlab = "ejecfrac", 
      legend.xy = c(3.5,110))

lindner.s10 <- as.numeric(cut(ps, quantile(ps, seq(0, 1, 1/5)),
      include.lowest = TRUE, labels = FALSE))
box.psa(height, abcix, lindner.s10, xlab="height", 
      boxwex = .15, offset = .15, legend.xy = c(2,130), balance = TRUE)



