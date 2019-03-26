library(EMbC)


### Name: stts
### Title: Clustering statistics.
### Aliases: stts stts,binClst-method stts,binClstStck-method

### ** Examples

# -- apply EMbC to the example path with solar covariate 'height'--
mybcp <- stbc(expth,scv='height',info=-1)
# -- show clustering statistics --
stts(mybcp,width=5,dec=1)
## Not run: 
##D # -- show clustering statistics of mybcpstack at stack level --
##D stts(mybcpstack)
##D # -- show individual statistics for path number 3 in mybcpstack --
##D stts(slct(mybcpstack,3))
## End(Not run)



