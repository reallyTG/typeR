library(bqtl)


### Name: make.map.frame
### Title: Create marker map specifications
### Aliases: make.map.frame
### Keywords: manip

### ** Examples


data( little.map.dx )
little.map.frame <- make.map.frame( little.map.dx )
plot( little.map.frame ) # there is a plot method
# add 'virtual' markers to map
little.mf.5 <-   make.map.frame(little.map.frame,reso=5)
print(little.mf.5[1:10,],digits=1) # show a few rows
plot( little.mf.5 ) # notice the 'virtual' markers added
## Don't show: 
 rm( little.map.dx,little.map.frame ,little.mf.5) 
## End(Don't show)



