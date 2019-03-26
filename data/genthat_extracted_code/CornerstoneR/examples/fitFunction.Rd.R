library(CornerstoneR)


### Name: fitFunction
### Title: Fit Function to Data
### Aliases: fitFunction

### ** Examples

# Generate data from logistic function:
fun = function(x, a, b, c, d, sigma = 1) {
  a+(b-a) / (1+exp(-d*(x-c))) + rnorm(length(x), sd = sigma)
  }
library(data.table)
dt = data.table(  x1 = sample(seq(-10, 10, length.out = 100))
                  , group1 = sample(x = c("A", "B"), replace = TRUE, size = 100)
                  )
dt[group1 == "A", y1 := fun(x1, 1, 10, 1, 0.6, 0.1)]
dt[group1 == "B", y1 := fun(x1, 8, 2, -1, 0.3, 0.1)]
# Fit the logistic function:
res = fitFunction(dt, "x1", "y1", "group1", list(math.fun = "Logistic"), TRUE)
# Show estimated coefficients:
res$coeff
# Plot fitted vs. residuals:
plot(res$predictions$Fitted, res$predictions$Residuals)



