library(linpk)


### Name: dose.frame
### Title: Get the doses from a PK profile.
### Aliases: dose.frame

### ** Examples

t.obs <- seq(0, 6*24, 0.5)
y <- pkprofile(t.obs, cl=0.5, vc=11, ka=1.3,
    dose=list(t.dose=c(0, 24*2 + 14), amt=c(100, 50), addl=c(4, 0), ii=24))
dose.frame(y)



