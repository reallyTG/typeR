library(sharpshootR)


### Name: aggregateColorPlot
### Title: Plot aggregate soil color data
### Aliases: aggregateColorPlot
### Keywords: hplots

### ** Examples

## Not run: 
##D data(loafercreek, package = 'soilDB')
##D 
##D # generalize horizon names using REGEX rules
##D n <- c('Oi', 'A', 'BA','Bt1','Bt2','Bt3','Cr','R')
##D p <- c('O', '^A$|Ad|Ap|AB','BA$|Bw', 
##D 'Bt1$|^B$','^Bt$|^Bt2$','^Bt3|^Bt4|CBt$|BCt$|2Bt|2CB$|^C$','Cr','R')
##D loafercreek$genhz <- generalize.hz(loafercreek$hzname, n, p)
##D 
##D # remove non-matching generalized horizon names
##D loafercreek$genhz[loafercreek$genhz == 'not-used'] <- NA
##D loafercreek$genhz <- factor(loafercreek$genhz)
##D 
##D # aggregate color data, this function is from the `aqp` package
##D a <- aggregateColor(loafercreek, 'genhz')
##D 
##D # plot
##D par(mar=c(1,4,4,1))
##D aggregateColorPlot(a, print.n.hz = TRUE)
## End(Not run)



