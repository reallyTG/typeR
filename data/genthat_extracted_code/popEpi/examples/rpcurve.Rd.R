library(popEpi)


### Name: rpcurve
### Title: Marginal piecewise parametric relative survival curve
### Aliases: rpcurve

### ** Examples

## Not run: 
##D ## use the simulated rectal cancer cohort
##D data("sire", package = "popEpi")
##D ab <- c(0,45,55,65,70,Inf)
##D sire$agegr <- cut(sire$dg_age, breaks = ab, right = FALSE)
##D 
##D BL <- list(fot= seq(0,10,1/12))
##D pm <- data.frame(popEpi::popmort)
##D x <- lexpand(sire, breaks=BL, pophaz=pm, 
##D              birth = bi_date, 
##D              entry = dg_date, exit = ex_date, 
##D              status  = status %in% 1:2)
##D 
##D rpm <- relpois(x, formula = lex.Xst %in% 1:2 ~ -1+ FOT + agegr, 
##D                fot.breaks=c(0,0.25,0.5,1:8,10))
##D pmc <- rpcurve(rpm)
##D 
##D ## compare with non-parametric estimates
##D names(pm) <- c("sex", "per", "age", "haz")
##D x$agegr <- cut(x$dg_age, c(0,45,55,65,75,Inf), right = FALSE)
##D st <- survtab(fot ~ adjust(agegr), data = x, weights = "internal",
##D               pophaz = pm)
##D 
##D 
##D plot(st, y = "r.e2.as")
##D lines(y = pmc$est, x = pmc$Tstop, col="red")
## End(Not run)






