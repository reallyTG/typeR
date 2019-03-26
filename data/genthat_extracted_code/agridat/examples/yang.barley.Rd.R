library(agridat)


### Name: yang.barley
### Title: Multi-environment trial of barley in Alberta, 6 varieties at 18
###   locations in Alberta.
### Aliases: yang.barley
### Keywords: datasets

### ** Examples


data(yang.barley)
dat <- yang.barley

if(require(reshape2)){
  dat <- acast(dat, gen~site, value.var='yield')
}

## Not run: 
##D 
##D   ## For bootstrapping of a biplot, see the non-cran packages:
##D   ## 'bbplot' and 'distfree.cr'
##D   ## http://statgen.ualberta.ca/index.html?open=software.html
##D   ## install.packages("http://statgen.ualberta.ca/download/software/bbplot_1.0.zip")
##D   ## install.packages("http://statgen.ualberta.ca/download/software/distfree.cr_1.5.zip")
##D 
##D   ## require(SDMTools)
##D   ## require(distfree.cr)
##D   ## require(bbplot)
##D 
##D   ## d1 <- bbplot.boot(dat, nsample=2000) # bootstrap the data
##D   ## plot(d1) # plot distributions of principal components
##D   ## b1 <- bbplot(d1) # create data structures for the biplot
##D   ## plot(b1) # create the confidence regions on the biplot
##D 
## End(Not run)




