library(tis)


### Name: nberShade.ggplot
### Title: Plotting NBER Recesssions in the ggplot graphics system
### Aliases: nberShade.ggplot
### Keywords: aplot

### ** Examples

    ## Not run: 
##D         require("ggplot2")
##D         ggp <- ggplot(aes(x=date, y=100*unemploy/pop), data=economics)
##D 
##D         nberShade( ggp ) + xlim(as.Date("1967-01-01"), Sys.Date()) + 
##D         opts(legend.position="none") + geom_line() + theme_bw()
##D 
##D         nberShade( ggp, fill = "yellow", color = "pink",                      
##D                 xrange = c("1969-01-01", "2008-02-01"), openShade = FALSE) + 
##D         opts(legend.position="none") + geom_line(size=1) + theme_bw()
##D     
## End(Not run)



