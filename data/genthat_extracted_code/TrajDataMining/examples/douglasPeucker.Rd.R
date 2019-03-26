library(TrajDataMining)


### Name: douglasPeucker
### Title: Douglas Peucker
### Aliases: douglasPeucker douglasPeucker,Track,numeric-method

### ** Examples

## Not run: 
##D library(ggplot2)
##D 
##D dist <- max(A1@connections$distance)
##D 
##D douglasp <- douglasPeucker(A1,dist)
##D 
##D df <- data.frame(x=douglasp@sp@coords[,1],y=douglasp@sp@coords[,2])
##D ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1))
## End(Not run)



