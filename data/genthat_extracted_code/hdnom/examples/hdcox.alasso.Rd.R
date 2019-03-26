library(hdnom)


### Name: hdcox.alasso
### Title: Adaptive Lasso Model Selection for High-Dimensional Cox Models
### Aliases: hdcox.alasso

### ** Examples

library("survival")
library("rms")

# Load imputed SMART data
data("smart")
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

# Fit Cox model with adaptive lasso penalty
fit = hdcox.alasso(x, y, nfolds = 3, rule = "lambda.1se", seed = c(7, 11))

# Prepare data for hdnom.nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$alasso_model, model.type = "alasso",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

plot(nom)



