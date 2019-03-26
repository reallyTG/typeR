library(mthapower)


### Name: mthacases
### Title: Sample size calculations - mtDNA haplogroups
### Aliases: mthacases

### ** Examples

mydata <- mthacases(p0=0.445, Nh=11,
                    OR.cas.ctrl=c(2), power=80,
                    sig.level=0.05) # Baudouin study
mydata <- mthacases(p0=0.445, Nh=11,
                    OR.cas.ctrl=c(1.25,1.5,1.75,2,2.25,2.5,2.75,3),
                    power=80, sig.level=0.05)
mydata <- mydata[c(2,6)]
mydata
plot(mydata)




