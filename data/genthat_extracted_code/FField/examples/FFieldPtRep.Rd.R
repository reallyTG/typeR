library(FField)


### Name: FFieldPtRep
### Title: Force field simulation for a set of points
### Aliases: FFieldPtRep

### ** Examples

  library(ggplot2)
  
  # Normalize coordinates to maintain constant aspect ratio
  x.fact <- 100 / max(mtcars$wt)
  y.fact <- 100 / max(mtcars$mpg)
  
  # Repel points
  coords <-
    FFieldPtRep(coords = cbind(mtcars$wt * x.fact, 
                               mtcars$mpg * y.fact),
                rep.fact = 40)
  
  # Convert back to plot coordinates
  x.t <- coords$x / x.fact
  y.t <- coords$y / y.fact
  
  # Sample plot with repelled labels
  p2 <- 
    (ggplot(mtcars, aes(x = wt, 
                        y = mpg, 
                        label = rownames(mtcars)))  
     + geom_point()
     + geom_text(x = x.t,
                 y = y.t)
     + geom_segment(data = mtcars,
                    xend = x.t,
                    yend = y.t)
     + ggtitle("After"))
  p2



