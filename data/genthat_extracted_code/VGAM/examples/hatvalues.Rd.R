library(VGAM)


### Name: hatvalues
### Title: Hat Values and Regression Deletion Diagnostics
### Aliases: hatvalues hatvaluesvlm hatplot hatplot.vlm dfbeta dfbetavlm
### Keywords: regression

### ** Examples

# Proportional odds model, p.179, in McCullagh and Nelder (1989)
pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, cumulative, data = pneumo)
hatvalues(fit)  # n x M matrix, with positive values
all.equal(sum(hatvalues(fit)), fit@rank)  # Should be TRUE
## Not run: 
##D  par(mfrow = c(1, 2))
##D hatplot(fit, ylim = c(0, 1), las = 1, col = "blue") 
## End(Not run)



