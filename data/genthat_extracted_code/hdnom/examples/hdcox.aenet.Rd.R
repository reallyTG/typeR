library(hdnom)


### Name: hdcox.aenet
### Title: Adaptive Elastic-Net Model Selection for High-Dimensional Cox
###   Models
### Aliases: hdcox.aenet

### ** Examples

library("survival")
library("rms")

# Load imputed SMART data
data("smart")
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

# To enable parallel parameter tuning, first run:
# library("doParallel")
# registerDoParallel(detectCores())
# then set hdcox.aenet(..., parallel = TRUE).

# Fit Cox model with adaptive elastic-net penalty
fit = hdcox.aenet(
  x, y, nfolds = 3, alphas = c(0.3, 0.7),
  rule = "lambda.1se", seed = c(5, 7))

# Prepare data for hdnom.nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$aenet_model, model.type = "aenet",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

plot(nom)



