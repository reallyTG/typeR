library(hdnom)


### Name: hdnom.nomogram
### Title: Nomograms for High-Dimensional Cox Models
### Aliases: hdnom.nomogram

### ** Examples

library("rms")

# Load imputed SMART data
data(smart)
x = as.matrix(smart[, -c(1, 2)])
time = smart$TEVENT
event = smart$EVENT
y = Surv(time, event)

# Fit penalized Cox model with lasso penalty
fit = hdcox.lasso(x, y, nfolds = 5, rule = "lambda.1se", seed = 11)

# Prepare data needed for plotting nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$lasso_model, model.type = "lasso",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

print(nom)
plot(nom)



