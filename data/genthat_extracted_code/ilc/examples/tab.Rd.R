library(ilc)


### Name: tab
### Title: Sample survival data with additional effects (other than age and
###   time).
### Aliases: tab
### Keywords: datasets

### ** Examples

# print out the first 10 observations:
tab[1:10,]
# sub-group by a single additional covariate and merge ages above 95:
mdat <- rhdata(tab, covar=c('cov2'), xbreaks=c(40:95, 105), xlabels=c(40:94, '95>'),
  ybreaks=mdy.date(1,1,2000:2007), ylabels=2000:2006, name='M', label='CMI')
mdat



