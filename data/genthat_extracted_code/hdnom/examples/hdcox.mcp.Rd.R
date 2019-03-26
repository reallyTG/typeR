library(hdnom)


### Name: hdcox.mcp
### Title: MCP Model Selection for High-Dimensional Cox Models
### Aliases: hdcox.mcp

### ** Examples

library("survival")
library("rms")

# Load imputed SMART data; only use the first 150 samples
data("smart")
x = as.matrix(smart[, -c(1, 2)])[1:150, ]
time = smart$TEVENT[1:150]
event = smart$EVENT[1:150]
y = Surv(time, event)

# Fit Cox model with MCP penalty
fit = hdcox.mcp(x, y, nfolds = 3, gammas = c(2.1, 3), seed = 1001)

# Prepare data for hdnom.nomogram
x.df = as.data.frame(x)
dd = datadist(x.df)
options(datadist = "dd")

# Generate hdnom.nomogram objects and plot nomogram
nom = hdnom.nomogram(
  fit$mcp_model, model.type = "mcp",
  x, time, event, x.df, pred.at = 365 * 2,
  funlabel = "2-Year Overall Survival Probability")

plot(nom)



