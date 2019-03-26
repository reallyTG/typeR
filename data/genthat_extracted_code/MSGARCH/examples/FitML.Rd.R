library(MSGARCH)


### Name: FitML
### Title: Maximum Likelihood estimation.
### Aliases: FitML

### ** Examples

# create model specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# fit the model on the data by ML
fit <- FitML(spec = spec, data = SMI)
summary(fit)

# custom optimizer example
## Not run: 
##D f_custom_optim <- function(vPw, f_nll, spec, data, do.plm){
##D  out <- stats::optim(vPw, f_nll, spec = spec, data = data,
##D                      do.plm = do.plm, method = "Nelder-Mead")
##D  return(out)
##D }
##D 
##D set.seed(123)
##D fit <- FitML(spec, data = SMI, ctr = list(OptimFUN = f_custom_optim))
##D summary(fit)
## End(Not run)



