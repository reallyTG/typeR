library(mc2d)


### Name: mcapply
### Title: Apply Functions Over mc or mcnode Objects
### Aliases: mcapply
### Keywords: misc

### ** Examples

data(total)
xVUM
mcapply(xVUM, "unc", sum)
mcapply(xVUM, "var", sum)
mcapply(xVUM, "all", sum)
mcapply(xVUM, "variates", sum)
mcapply(total, "all", exp)



