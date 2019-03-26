library(xgobi)


### Name: xgobi
### Title: XGobi: Dynamic Graphics for Data Analysis
### Aliases: xgobi xgobi.colors.default
### Keywords: dynamic multivariate

### ** Examples

data(laser)
xgobi(laser)

Xdir <- file.path(dirname(tempfile()), "xgobi")
## Don't show: 
if(file.exists(Xdir)) unlink(Xdir, recursive = TRUE)
## End(Don't show)
dir.create(Xdir)
xgobi(laser, colors = xgobi.colors.default[c(1,3,5,7,9,10)[as.factor(laser$ Ir)]],
      glyphs = c(23,8)[1+(laser$lambda > 1576)],
      keep = TRUE, fprefix="xgobi/L-")
file.info(list.files(Xdir, full=TRUE))[, c(1,3,4)] # >> Files "L-laser..."
## remove manually when finally unused:
unlink(Xdir, recursive = TRUE)

##>>> see also the morsecodes example in  help(xgvis) <<<
##                 ------------------     -----------



