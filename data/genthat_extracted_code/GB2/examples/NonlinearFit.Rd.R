library(GB2)


### Name: NonlinearFit
### Title: Fitting the GB2 by Minimizing the Distance Between a Set of
###   Empirical Indicators and Their GB2 Expressions
### Aliases: NonlinearFit nlsfit.gb2
### Keywords: distribution

### ** Examples

# Takes long time to run, as it makes a call to the function ml.gb2

## Not run: 
##D library(laeken)
##D data(eusilc)
##D 
##D # Personal income
##D inc <- as.vector(eusilc$eqIncome)
##D 
##D # Sampling weights
##D w <- eusilc$rb050
##D 
##D # Data set
##D d <- data.frame(inc, w)
##D d <- d[!is.na(d$inc),]
##D    
##D # Truncate at 0
##D d <- d[d$inc > 0,]
##D inc <- d$inc
##D w   <- d$w
##D 
##D # ML fit, full log-likelihood
##D fitf <- ml.gb2(inc, w)$opt1
##D 
##D # Estimated parameters
##D af <- fitf$par[1]
##D bf <- fitf$par[2]
##D pf <- fitf$par[3]
##D qf <- fitf$par[4]
##D 
##D gb2.par <- c(af, bf, pf, qf)
##D 
##D # Empirical indicators
##D indicEMP  <- main.emp(inc, w)
##D indicEMP <- c(indicEMP[1],indicEMP[3:6])
##D indicE <- round(indicEMP, digits=3)
##D 
##D # Nonlinear fit
##D nn <- nlsfit.gb2(indicEMP[1,3:6],indicEMP[3:6])
##D an <- nn[[1]][1]
##D bn <- nn[[1]][2]
##D pn <- nn[[1]][3]
##D qn <- nn[[1]][4]
##D 
##D # GB2 indicators
##D indicNLS <- c(main.gb2(0.6, an, bn, pn, qn)[1], main.gb2(0.6, an, bn, pn, qn)[3:6])
##D indicML <- c(main.gb2(0.6, af, bf, pf, qf)[1], main.gb2(0.6, af, bf, pf, qf)[3:6])
##D indicN <- round(indicNLS, digits=3)
##D indicM <- round(indicML, digits=3)
##D 
##D # Likelihoods
##D nlik <- loglp.gb2(inc, an, bn, pn, qn, w)
##D mlik <- loglp.gb2(inc, af, bf, pf, qf, w)
##D 
##D # Results
##D type=c("Emp. est", "NLS", "ML full")
##D results <- data.frame(type=type,
##D         median=c(indicE[1], indicN[1], indicM[1]),
##D         ARPR=c(indicE[2], indicN[2], indicM[2]),
##D         RMPG=c(indicE[3], indicN[3], indicM[3]),
##D         QSR =c(indicE[4], indicN[4], indicM[4]),
##D         GINI=c(indicE[5], indicN[5], indicM[5]),
##D         likelihood=c(NA, nlik, mlik),
##D         a=c(NA, an, af), b=c(NA, bn, bf) ,p=c(NA, pn, pf), q=c(NA, qn, qf))
##D 
## End(Not run)



