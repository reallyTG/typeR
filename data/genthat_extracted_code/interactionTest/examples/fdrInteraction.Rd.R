library(interactionTest)


### Name: fdrInteraction
### Title: Critical t-statistic
### Aliases: fdrInteraction

### ** Examples

## Not run: 
##D  
##D data(legfig)                # Clark and Golder 2006 replication data
##D 
##D # limit to established democracies from the 1990s
##D dat<-subset(legfig, subset=(nineties==1 & old==1))
##D 
##D lin.mod <- lm(enep1 ~ eneg + logmag + logmag_eneg + uppertier_eneg + uppertier +
##D proximity1 + proximity1_enpres + enpres, data=dat)
##D 
##D # save betas
##D beta.mod <- coefficients(lin.mod)
##D # save vcv
##D vcv.mod <- vcov(lin.mod)
##D 
##D # calculate MEs
##D mag <- seq(from=0.01, to=5, by=0.01)
##D me.vec <- beta.mod[2] + beta.mod[4]*mag
##D me.se <- sqrt( vcv.mod[2,2] + (mag^2)*vcv.mod[4,4] + 2*(mag)*(vcv.mod[2,4]) )
##D 
##D ci.hi <- me.vec + 1.697 * me.se
##D ci.lo <- me.vec - 1.697 * me.se
##D 
##D plot(me.vec ~ mag, type="l", ylim = c(-4, 6))
##D lines(ci.hi ~ mag, lty=2)
##D lines(ci.lo ~ mag, lty=2)
##D 
##D fdrInteraction(me.vec, me.se, df=lin.mod$df, level=0.90)                  # 4.233986
##D 
##D ci.hi <- me.vec + 4.233986 * me.se
##D ci.lo <- me.vec - 4.233986 * me.se
##D 
##D lines(ci.hi ~ mag, lty=2, lwd=2)
##D lines(ci.lo ~ mag, lty=2, lwd=2)
##D 
##D abline(h=0, lty=1, col="gray")
##D legend("topleft", lwd=c(1,2), lty=c(1,2), legend=c("90% CI", "90% FDR CI"))
## End(Not run)



