library(ExtremeBounds)


### Name: hist.eba
### Title: Histograms for Extreme Bounds Analysis
### Aliases: hist.eba
### Keywords: models regression nonlinear robust multivariate

### ** Examples

# perform Extreme Bounds Analysis

eba.results <- eba(formula = mpg ~ wt | hp + gear | cyl + disp + drat + qsec + vs + am + carb,
                   data = mtcars[1:10, ], k = 0:2)

# The same result can be achieved by running:
# eba.results <- eba(data = mtcars[1:10, ], y = "mpg", free = "wt",
#                    doubtful = c("cyl","disp","hp","drat","qsec","vs","am","gear","carb"),
#                    focus = c("hp","gear"), k = 0:2)

# create histograms, keeping the default settings
hist(eba.results)

# re-create histograms with customized settings
hist(eba.results, variables = c("hp","gear"),
     main = c("hp" = "Gross horsepower", "gear" = "Number of forward gears"),
     mu.visible=FALSE, normal.show=TRUE, normal.lwd=1)



