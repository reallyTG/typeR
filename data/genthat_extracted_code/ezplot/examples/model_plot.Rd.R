library(ezplot)


### Name: model_plot
### Title: model_plot
### Aliases: model_plot

### ** Examples

y = rnorm(26)
df = data.frame(ID = 1:26, actual = y + rnorm(26), fitted = y, id = letters)
model_plot(df, "ID", "actual", "fitted")
model_plot(df, "id", "actual", "fitted")



