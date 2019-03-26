library(plsr)


### Name: biplot.plsr
### Title: Biplot for plsr Objects
### Aliases: biplot.plsr

### ** Examples

plsr_obj = pls(rating_data,tracking_data,10,10)
biplot(plsr_obj)
## No test: 
biplot(plsr_obj, LV=c(2,3), side="Y")
## End(No test)



