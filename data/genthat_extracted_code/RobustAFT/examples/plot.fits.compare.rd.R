library(RobustAFT)


### Name: plot.fits.compare
### Title: Plot Method for "fits.compare" objects
### Aliases: plot.fits.compare

### ** Examples

## Not run: 
##D      data(D243)
##D      Cost <- D243$Cost                             # Cost (Swiss francs)
##D      LOS  <- D243$LOS                              # Length of stay (days)
##D      Adm  <- D243$Typadm; Adm <- (Adm==" Urg")*1   # Type of admission 
##D                                                    # (0=on notification, 1=Emergency)
##D 
##D      lwrob <- TML.noncensored(log(Cost)~log(LOS)+Adm, errors="logWeibull")
##D      reg   <- lm(log(Cost)~log(LOS)+Adm)
##D 
##D      comp  <- fits.compare(least.squares=reg, TML.logWeibull=lwrob)
##D      plot(comp, leg.position=c("topleft", "topleft", "bottomleft"), xplots=TRUE)
## End(Not run)



