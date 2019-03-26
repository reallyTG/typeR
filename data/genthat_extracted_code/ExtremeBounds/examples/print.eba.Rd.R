library(ExtremeBounds)


### Name: print.eba
### Title: Print Extreme Bounds Analysis Results
### Aliases: print.eba
### Keywords: models regression nonlinear robust multivariate

### ** Examples

# perform Extreme Bounds Analysis

eba.results <- eba(formula = mpg ~ wt | hp + gear | cyl + disp + drat + qsec + vs + am + carb,
                   data = mtcars[1:10, ], k = 0:2)

# The same result can be achieved by running:
# eba.results <- eba(data = mtcars[1:10, ], y = "mpg", free = "wt",
#                    doubtful = c("cyl","disp","hp","drat","qsec","vs","am","gear","carb"),
#                    focus = c("hp","gear"), k = 0:2)

# print out results, rounded to 2 decimal places
print(eba.results, digits = 2)



