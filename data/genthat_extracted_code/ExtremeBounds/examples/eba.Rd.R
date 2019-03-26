library(ExtremeBounds)


### Name: eba
### Title: Extreme Bounds Analysis
### Aliases: eba summary.eba coefficients.eba
### Keywords: models regression nonlinear robust multivariate

### ** Examples

# perform Extreme Bounds Analysis

eba.results <- eba(formula = mpg ~ wt | hp + gear | cyl + disp + drat + qsec + vs + am + carb,
                   data = mtcars[1:10, ], exclusive = ~ cyl + disp + hp | am + gear)

# The same result can be achieved by running:
# eba.results <- eba(data = mtcars[1:10, ], y = "mpg", free = "wt",
#                    doubtful = c("cyl", "disp", "hp", "drat", "qsec", 
#                                 "vs", "am", "gear", "carb"),
#                    focus = c("hp", "gear"), 
#                    exclusive = list(c("cyl", "disp", "hp"), 
#                                     c("am", "gear")))

# print out results
print(eba.results)

# create histograms
hist(eba.results, variables = c("hp","gear"),
     main = c("hp" = "Gross horsepower", "gear" = "Number of forward gears"))



