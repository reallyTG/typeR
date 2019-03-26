library(ggfortify)


### Name: fortify.varprd
### Title: Convert 'vars::varprd' to 'data.frame'
### Aliases: fortify.varprd

### ** Examples

data(Canada, package = 'vars')
d.var <- vars::VAR(Canada, p = 3, type = 'const')
fortify(stats::predict(d.var, n.ahead = 50))



