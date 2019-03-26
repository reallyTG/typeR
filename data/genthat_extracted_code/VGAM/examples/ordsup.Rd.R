library(VGAM)


### Name: ordsup
### Title: Ordinal Superiority Measures
### Aliases: ordsup ordsup.vglm
### Keywords: models regression

### ** Examples

## Not run: 
##D Mental <- read.table("http://www.stat.ufl.edu/~aa/glm/data/Mental.dat",
##D                      header = TRUE)  # Make take a while to load in
##D Mental$impair <- ordered(Mental$impair)
##D pfit3 <- vglm(impair ~ ses + life, data = Mental,
##D          cumulative(link = "probit", reverse = FALSE, parallel = TRUE))
##D coef(pfit3, matrix = TRUE)
##D ordsup(pfit3)  # The 'ses' variable is binary
##D 
##D # Fit a crude LM
##D fit7 <- vglm(as.numeric(impair) ~ ses + life, uninormal, data = Mental)
##D coef(fit7, matrix = TRUE)  # 'sd' is estimated by MLE
##D ordsup(fit7)
##D ordsup(fit7, all.vars = TRUE)  # Some output may not be meaningful
##D ordsup(fit7, confint = TRUE, method = "profile")
## End(Not run)



