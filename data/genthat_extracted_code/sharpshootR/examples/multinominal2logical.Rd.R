library(sharpshootR)


### Name: multinominal2logical
### Title: Convert multinominal to logical matrix
### Aliases: multinominal2logical
### Keywords: manip

### ** Examples

## Not run: 
##D # sample data, an SPC
##D data(loafercreek, package='soilDB')
##D 
##D # convert to factor
##D loafercreek$hillslope_pos <- factor(loafercreek$hillslope_pos, 
##D levels=c('Toeslope', 'Footslope', 'Backslope', 'Shoulder', 'Summit'))
##D 
##D # convert to logical matrix
##D hp <- multinominal2logical(loafercreek, 'hillslope_pos')
##D 
##D # join-in to site data
##D site(loafercreek) <- hp
##D 
##D # variable names
##D v <- c('lithic.contact', 'paralithic.contact', 
##D 'argillic.horizon', 'Toeslope', 'Footslope', 
##D 'Backslope', 'Shoulder', 'Summit')
##D 
##D # visualize with some other diagnostic features
##D x <- diagnosticPropertyPlot(loafercreek, v, k=5, 
##D grid.label='bedrock_kind', dend.label='pedon_id')
## End(Not run)



