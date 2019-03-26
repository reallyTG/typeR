library(agridat)


### Name: federer.tobacco
### Title: Height of tobacco plants exposed to radiation
### Aliases: federer.tobacco

### ** Examples


data(federer.tobacco)
dat <- federer.tobacco

# RCB analysis.  Treatment factor not signficant.
dat <- transform(dat, dosef=factor(dose), rowf=factor(row),
                 blockf=factor(block))
m1 <- lm(height ~ blockf + dosef, data=dat)
anova(m1)

# RCB residuals show strong spatial trends
if(require(desplot)){
dat$resid <- resid(m1)
desplot(resid ~ row * block, data=dat,
        # aspect unknown
        main="federer.tobacco")
}

# Row-column analysis.  Treatment now significant
m2 <- lm(height ~ rowf + blockf + dosef, data=dat)
anova(m2)




