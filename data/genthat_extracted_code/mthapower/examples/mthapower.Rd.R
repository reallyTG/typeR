library(mthapower)


### Name: mthapower
### Title: Post-hoc power calculations - mtDNA haplogroups
### Aliases: mthapower

### ** Examples

# Example 1:
pow <- mthapower(n.cases=203, p0=0.443, Nh=13, OR.cas.ctrl=2.33, sig.level=0.05)

# Example 2:
# Create data frames
pow.H150 <- mthapower(n.cases=seq(50,1000,by=50), p0=0.433, Nh=11,
                      OR.cas.ctrl=1.5, sig.level=0.05)
pow.H175 <- mthapower(n.cases=seq(50,1000,by=50), p0=0.433, Nh=11,
                      OR.cas.ctrl=1.75, sig.level=0.05)
pow.H200 <- mthapower(n.cases=seq(50,1000,by=50), p0=0.433, Nh=11,
                      OR.cas.ctrl=2, sig.level=0.05)
pow.H250 <- mthapower(n.cases=seq(50,1000,by=50), p0=0.433, Nh=11,
                      OR.cas.ctrl=2.5, sig.level=0.05)

# Bind the three data frames:
bindata <- rbind(pow.H150,pow.H175,pow.H200,pow.H250)
# Adds column OR to binded data frame:
bindata$OR <- rep(factor(c(1.50,1.75,2,2.5)),
              times = c(nrow(pow.H150),
                        nrow(pow.H175),
                        nrow(pow.H200),
                        nrow(pow.H250)))
# Create plot:
# install.packages("car")
library(car)
scatterplot(power~ncases | OR, reg.line=FALSE,
            smooth=FALSE, spread=FALSE,
            boxplots=FALSE, span=0.25, by.groups=FALSE,
            data=bindata)




