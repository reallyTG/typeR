library(dobson)


### Name: stroke.wide
### Title: Stroke data from table 11.1
### Aliases: stroke.wide
### Keywords: datasets

### ** Examples

data(stroke.wide)
summary(stroke.wide)

# To transform data from wide to long format use
## Not run: 
##D library(reshape2)
##D stroke = melt(data=stroke.wide, id.vars=c('Subject','Group'), 
##D   value.name='ability', variable.name='week')
##D stroke$time = as.numeric(gsub('week', '', stroke$week))
## End(Not run)



