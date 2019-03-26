library(CoxPhLb)


### Name: coxph.lb
### Title: Fit Cox Model to Right-Censored Length-Biased Data
### Aliases: coxph.lb

### ** Examples

## Not run: 
##D # Fit a Cox model using model based variance estimation
##D fit.ee <- coxph.lb(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
##D           cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), method="EE", print.out = TRUE)
##D print(fit.ee)			# display the results
##D 
##D # Fit a Cox model using bootstrap resampling method
##D fit.bs <- coxph.lb(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
##D           cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), method="Bootstrap",
##D           seed.n=1234, print.out=TRUE)
##D print(fit.bs)			# display the results
## End(Not run)



