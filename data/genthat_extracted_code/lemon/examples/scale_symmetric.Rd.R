library(lemon)


### Name: scale_x_symmetric
### Title: Symmetrix position scale for continuous x and y
### Aliases: scale_x_symmetric scale_y_symmetric

### ** Examples

library(ggplot2)
df <- expand.grid(a=c(-1,0,1), b=c(-1,0,1))
rnorm2 <- function(x,y,n,sdx,sdy) {
  if (missing(sdy)) 
    sdy <- sdx
  data.frame(a=x,b=y,x=rnorm(n,x,sdx), y=rnorm(n,y,sdy))
}
df <- mapply(rnorm2,df$a, df$b, MoreArgs=list(n=30,sdx=1),SIMPLIFY=FALSE)
df <- do.call(rbind, df)
(p <- ggplot(df, aes(x=x,y=y)) + geom_point() + 
  facet_grid(a~b, scales='free_x')
)
p + scale_x_symmetric(mid=0)



