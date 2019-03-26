library(pedometrics)


### Name: statsMS
### Title: Obtain performance statistics of a series of linear models
### Aliases: statsMS
### Keywords: manip models

### ** Examples

## Not run: 
##D # based on the second example of function stepAIC
##D require(MASS)
##D cpus1 <- cpus
##D for(v in names(cpus)[2:7])
##D   cpus1[[v]] <- cut(cpus[[v]], unique(quantile(cpus[[v]])), 
##D                     include.lowest = TRUE)
##D cpus0 <- cpus1[, 2:8]  # excludes names, authors' predictions
##D cpus.samp <- sample(1:209, 100)
##D cpus.form <- list(formula(log10(perf) ~ syct + mmin + mmax + cach + chmin +
##D                   chmax + perf),
##D                   formula(log10(perf) ~ syct + mmin + cach + chmin + chmax),
##D                   formula(log10(perf) ~ mmax + cach + chmin + chmax + perf))
##D data <- cpus1[cpus.samp,2:8]
##D cpus.ms <- buildMS(cpus.form, data, vif = TRUE, aic = TRUE)
##D cpus.des <- data.frame(a = c(0, 1, 0), b = c(1, 0, 1), c = c(1, 1, 0))
##D stats <- statsMS(cpus.ms, design.info = cpus.des, arrange.by = "aic")
## End(Not run)




