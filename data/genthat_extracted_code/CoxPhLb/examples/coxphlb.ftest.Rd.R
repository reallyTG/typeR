library(CoxPhLb)


### Name: coxphlb.ftest
### Title: Test the Functional Form of Covariates in Cox Model with
###   Right-Censored Length-Biased Data
### Aliases: coxphlb.ftest

### ** Examples

# Fit a Cox model
fit.ee <- coxph.lb(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
          cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), method="EE")

# Check the Functional Form of the Cox Model
ftest <- coxphlb.ftest(ExampleData1$y, ExampleData1$a, ExampleData1$delta,
         cbind(x1=ExampleData1$x1, x2=ExampleData1$x2), fit=as.vector(fit.ee$coef),
         spec.p=c(2), plot.p=TRUE, n.plot=50, seed.n=1234, print.out=TRUE)
print(ftest)			# display the results



