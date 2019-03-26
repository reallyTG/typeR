library(TrajDataMining)


### Name: speedFilter
### Title: Speed filter
### Aliases: speedFilter speedFilter,Track,numeric-method

### ** Examples

library(ggplot2)

speed <- min(A1@connections$speed)

sf <- speedFilter(A1,speed)

df <- data.frame(x=sf@sp@coords[,1],y=sf@sp@coords[,2])

ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')




