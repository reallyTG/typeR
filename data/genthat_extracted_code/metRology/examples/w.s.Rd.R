library(metRology)


### Name: welch.satterthwaite
### Title: Welch-Satterthwaite effective degrees of freedom
### Aliases: w.s welch.satterthwaite
### Keywords: univar

### ** Examples


u <- c(0.1, 0.3, 0.2, 1.1)
ci <- c(1.0, 2.0, 3.0, 0.5)
degfree <- c(Inf,6,8,3)

w.s(ui=u,df=degfree, ci=ci)




