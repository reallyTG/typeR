library(CoxPhLb)


### Name: coxphlb.phtest
### Title: Test the Proportional Hazards Assumption of Cox Model with
###   Right-Censored Length-Biased Data
### Aliases: coxphlb.phtest

### ** Examples

## Not run: 
##D # Fit a Cox model
##D fit.ee <- coxph.lb(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
##D           cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), method="EE")
##D 
##D # Check the Proportional Hazards Assumption
##D ptest1 <- coxphlb.phtest(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
##D           cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), fit=as.vector(fit.ee$coef),
##D           spec.p=c(2), plot.p=TRUE, n.plot=50, seed.n=1234, print.out=TRUE)
##D print(ptest1)			# display the results
##D 
##D 
##D # Run a Global Test
##D coxphlb.phtest(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
##D       cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), fit=as.vector(fit.ee$coef),
##D       spec.p=NULL, seed.n=1234, print.out=TRUE)
## End(Not run)



