library(aqp)


### Name: aggregateColor
### Title: Summarize Soil Colors
### Aliases: aggregateColor
### Keywords: manip

### ** Examples

# load some example data
data(sp1, package='aqp')

# upgrade to SoilProfileCollection and convert Munsell colors
sp1$soil_color <- with(sp1, munsell2rgb(hue, value, chroma))
depths(sp1) <- id ~ top + bottom
site(sp1) <- ~ group

# generalize horizon names
n <- c('O', 'A', 'B', 'C')
p <- c('O', 'A', 'B', 'C')
sp1$genhz <- generalize.hz(sp1$name, n, p)

# aggregate colors over horizon-level attribute: 'genhz'
a <- aggregateColor(sp1, 'genhz')

# aggregate colors over site-level attribute: 'group'
a <- aggregateColor(sp1, 'group')

# aggregate colors over depth-slices
s <- slice(sp1, c(5, 10, 15, 25, 50, 100, 150) ~ soil_color)
s$slice <- paste0(s$top, ' cm')
a <- aggregateColor(s, 'slice')

## Not run: 
##D # optionally plot with helper function
##D if(require(sharpshootR))
##D   aggregateColorPlot(a)
## End(Not run)

# a more interesting example
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
##D a <- aggregateColor(loafercreek, 'genhz')
##D 
##D # plot results with helper function
##D par(mar=c(1,4,4,1))
##D aggregateColorPlot(a, print.n.hz = TRUE)
##D 
##D # inspect aggregate data
##D a$aggregate.data
## End(Not run)



