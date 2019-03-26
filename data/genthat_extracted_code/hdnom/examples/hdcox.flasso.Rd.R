library(hdnom)


### Name: hdcox.flasso
### Title: Fused Lasso Model Selection for High-Dimensional Cox Models
### Aliases: hdcox.flasso

### ** Examples

library("survival")
library("rms")

# Load imputed SMART data; only use the first 120 samples
data("smart")
x = as.matrix(smart[, -c(1, 2)])[1:120, ]
time = smart$TEVENT[1:120]
event = smart$EVENT[1:120]
y = Surv(time, event)

# Fit Cox model with fused lasso penalty
fit = hdcox.flasso(x, y,
  lambda1 = c(1, 10), lambda2 = c(0.01),
  nfolds = 3, seed = 11)

# Prepare data for hdnom.nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$flasso_model, model.type = "flasso",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

plot(nom)



