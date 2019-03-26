library(ggtern)


### Name: annotate
### Title: Create an annotation layer (ggtern version).
### Aliases: annotate

### ** Examples

ggtern() + 
annotate(geom  = 'text',
              x     = c(0.5,1/3,0.0),
              y     = c(0.5,1/3,0.0),
              z     = c(0.0,1/3,1.0),
              angle = c(0,30,60),
              vjust = c(1.5,0.5,-0.5),
              label = paste("Point",c("A","B","C")),
              color = c("green","red",'blue')) +
  theme_dark() + 
  theme_nomask()



