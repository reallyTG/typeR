library(gmvarkit)


### Name: predict.gmvar
### Title: Predict method for class 'gmvar' objects
### Aliases: predict.gmvar

### ** Examples

## No test: 
## These are long running examples that use parallel computing!

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2) model
fit12 <- fitGMVAR(data, p=1, M=2)
p1 <- predict(fit12, n_ahead=1, pred_type="cond_mean",
              plot_res=FALSE)
p1
p2 <- predict(fit12, n_ahead=10)
p2
p3 <- predict(fit12, n_ahead=10, ci_type="upper")
p3


# GMVAR(2,2) model
fit22 <- fitGMVAR(data, p=2, M=2)
p1 <- predict(fit22, n_ahead=20, pred_type="median")
p1
p2 <- predict(fit22, n_ahead=10, nt=20, lty=1)
p2
p3 <- predict(fit22, n_ahead=10, ci=c(0.99, 0.90, 0.80, 0.70),
              nt=30, lty=0)
p3
## End(No test)



