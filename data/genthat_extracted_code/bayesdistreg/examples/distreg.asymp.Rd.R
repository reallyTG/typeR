library(bayesdistreg)


### Name: distreg.asymp
### Title: Asymptotic distribution regression
### Aliases: distreg.asymp

### ** Examples

y = faithful$waiting
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
qtaus = quantile(y,c(0.05,0.25,0.5,0.75,0.95))
drabj<- dr_asympar(y=y,x=x,thresh = qtaus); data = data.frame(y,x)
(asymp.obj<- distreg.asymp(ind=2,drabj,data,vcovfn="vcov"))




