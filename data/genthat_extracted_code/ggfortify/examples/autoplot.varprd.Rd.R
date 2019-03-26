library(ggfortify)


### Name: autoplot.varprd
### Title: Autoplot 'vars::varprd'
### Aliases: autoplot.varprd

### ** Examples

data(Canada, package = 'vars')
d.var <- vars::VAR(Canada, p = 3, type = 'const')
autoplot(stats::predict(d.var, n.ahead = 50), is.date = TRUE)
autoplot(stats::predict(d.var, n.ahead = 50), conf.int = FALSE)



