library(heplots)


### Name: label.ellipse
### Title: Label an ellipse
### Aliases: label.ellipse

### ** Examples

circle <- function(center=c(0,0), radius=1, segments=60) {
   angles <- (0:segments)*2*pi/segments
   circle <- radius * cbind( cos(angles), sin(angles))
   t( c(center) + t( circle ))
}

label_demo <- function(ell) {
  plot(-2:2, -2:2, type="n", asp=1, main="label.pos values and points (0:60)")
  lines(ell, col="gray")
  points(0, 0, pch="+", cex=2)
  
  labs <- c("center", "bot", "left", "top", "right")
  for (i in 0:4) {
    label.ellipse(ell, label=paste(i, ":", labs[i+1]), label.pos = i)
  }
  for( i in 5*c(1,2, 4,5, 7,8, 10,11)) {
    points(ell[i,1], ell[i,2], pch=16)
    label.ellipse(ell, label=i, label.pos=i)
  }
}

circ <- circle(radius=1.8)
label_demo(circ)

ell <-circ %*% chol(matrix( c(1, .5, .5, 1), 2, 2)) 
label_demo(ell)



