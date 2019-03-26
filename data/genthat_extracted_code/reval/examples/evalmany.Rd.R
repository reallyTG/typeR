library(reval)


### Name: evalmany
### Title: Repeated evaluations
### Aliases: evalmany

### ** Examples

myfun = function(n, mean=0, sd = 1){
  x = rnorm(n, mean, sd)
  data.frame(sample.mean = mean(x), sample.sd = sd(x))
}
evalmany(myfun, mean = c(5, 9), sd = c(2, 3), default.args = list(n = 1e6))
evalmany(myfun, mean = seq(20), sd = seq(1, 4, by = 0.1),
  default.args = list(n = 1e6), method = "permute", sample = 10,
  collate.id = "multi", collate.prepend = "arg.")

# vector recycling
evalmany(myfun, mean = c(0, 3, 5), sd = c(1, 10),
  default.args = list(n = 1e6), method = "set", collate.id = "multi")

# Parallel processing
evalmany(myfun, mean = seq(0, 50, by = 10), sd = seq(1, 10, by = 1.5),
  default.args = list(n = 1e5), method = "permute", collate.id = "multi",
  clusters = 2)

## Not run: 
##D # Complex objects
##D formulas = list(y ~ 1, y ~ x, y ~ x + z)
##D datasets = list(
##D   A = data.frame(x = seq(0, 99), y = seq(0, 99) + rnorm(100)),
##D   B = data.frame(x = seq(0, 99), y = seq(0, 99) + rnorm(100, mean = 5)),
##D   C = data.frame(x = seq(0, 99), y = seq(0, 99) + rlnorm(100, meanlog = 1),
##D     z = seq(0, 99) - rlnorm(100, meanlog = -1))
##D )
##D # raw output
##D evalmany(lm, formula = formulas, data = datasets, method = "set",
##D   collate = FALSE)
##D # data extraction and error handling
##D evalmany(lm, formula = formulas, data = datasets, method = "permute",
##D   collate.id = "multi", collate.fun = function(x)
##D     data.frame(param = names(x$coefficients), value = x$coefficients,
##D     row.names=NULL))
## End(Not run)



