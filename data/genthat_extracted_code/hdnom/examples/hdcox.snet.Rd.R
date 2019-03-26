library(hdnom)


### Name: hdcox.snet
### Title: Snet Model Selection for High-Dimensional Cox Models
### Aliases: hdcox.snet

### ** Examples

library("survival")
library("rms")

# Load imputed SMART data; only use the first 120 samples
data("smart")
x = as.matrix(smart[, -c(1, 2)])[1:120, ]
time = smart$TEVENT[1:120]
event = smart$EVENT[1:120]
y = Surv(time, event)

# Fit Cox model with Snet penalty
fit = hdcox.snet(
  x, y, nfolds = 3,
  gammas = 3.7, alphas = c(0.3, 0.8),
  max.iter = 15000, seed = 1010)

# Prepare data for hdnom.nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$snet_model, model.type = "snet",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

plot(nom)



