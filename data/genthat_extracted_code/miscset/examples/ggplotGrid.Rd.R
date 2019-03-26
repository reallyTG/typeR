library(miscset)


### Name: ggplotGrid
### Title: Arrange a List of ggplots
### Aliases: ggplotGrid ggplotGridA4 ggplotlist

### ** Examples

#

## Not run: 
##D library(ggplot2)
##D d <- data.frame(a=1:5,b=1:5)
##D x <- list(
##D   ggplot(d, aes(x=a,y=b,col=b)) + geom_line(),
##D   ggplot(d, aes(x=a,y=b,shape=factor(b))) + geom_point())
##D ggplotlist(x, 2)
## End(Not run)

#



