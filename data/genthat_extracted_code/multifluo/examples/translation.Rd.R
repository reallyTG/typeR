library(multifluo)


### Name: translation
### Title: Translation of the data
### Aliases: translation

### ** Examples

data(gp)
data(count)
## No test: 
GP37Anew=translation(dtt=gp,dtc=count,interact=TRUE,dtt.lim=c(-0.4,0.8),dtc.lim=c(1000,4000))
## End(No test)
GP37Anew=translation(gp,x=7,y=-3)$data



