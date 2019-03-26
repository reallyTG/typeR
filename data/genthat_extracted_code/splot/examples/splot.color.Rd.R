library(splot)


### Name: splot.color
### Title: splot colors
### Aliases: splot.color

### ** Examples

# including no arguments or just a palette name will only return the palette as a character vector
pastel_palette = splot.color()
dark_palette = splot.color('dark')

# entering a number for x will generate that many variants of the first seed color
red_scale = splot.color(10, 'red')

# entering a list of values as x will return that many variants of the associated seed
red_and_green_scales = splot.color(list(10,10), seed=c('red','green'))

# this shows gradients of each color in the default palette
# a list entered as colorby is treated as arguments to splot.color
# periods before the position name refer to the internally assembled data
splot(
  rep(splot.color(),each=100)~rep.int(seq.int(.01,1,.01),9),colorby=list(.x,.y),
  lines=FALSE,mar=c(2,4,0,0),cex=c(points=3),leg=FALSE,pch=15,
  title="'pastel' palette",labx='value of x',laby='seed color'
)

# colors graded by value, entered in a list
plot(1:30,numeric(30),pch=15,cex=10,col=splot.color(list(1:8,c(7:1,1:7),8:1)))

# comparing sampling methods:
#   on top are 1000 similar colors, with different RGB ratios
#   on bottom are 268 colors with the same RGB ratio at different levels
splot(
  c(rnorm(1000),rnorm(1000,10))~rnorm(2000),lines=FALSE,
  colors=c(splot.color(1000),splot.color(1000,method='related'))
)




