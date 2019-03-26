library(crskdiag)


### Name: diag_crr
### Title: Checking Fine and Gray subdistribution hazards model with
###   cumulative sums of residuals
### Aliases: diag_crr
### Keywords: subdistribution diagnostics linear functional form link
###   function proportionality

### ** Examples

data(dat1)
out1 <- diag_crr(Crsk(time,cause)~z1+z2,data=dat1,test="lin",seed=1234)
print(out1)
plot(out1)

data(dat2)
out2 <- diag_crr(Crsk(time,cause)~z1+z2,data=dat2,test="prop",seed=1234)
print(out2)
plot(out2)



