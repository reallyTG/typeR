library(TrajDataMining)


### Name: owMeratniaBy
### Title: Ow Meratnia By
### Aliases: owMeratniaBy owMeratniaBy,Track,numeric,numeric-method

### ** Examples

## Not run: 
##D library(ggplot2)
##D 
##D speed <- max (A1@connections$speed)
##D 
##D distance <- max (A1@connections$distance)
##D 
##D ow <- owMeratniaBy(A1,distance,speed)
##D 
##D df <- data.frame(x=ow@sp@coords[,1],y=ow@sp@coords[,2])
##D 
##D ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')
## End(Not run)



