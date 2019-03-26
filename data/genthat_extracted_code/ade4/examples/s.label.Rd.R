library(ade4)


### Name: s.label
### Title: Scatter Plot
### Aliases: s.label
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  layout(matrix(c(1, 2, 3, 2), 2, 2))
  data(atlas)
  s.label(atlas$xy, lab = atlas$names.district, 
    area = atlas$area, inc = FALSE, addax = FALSE)
  data(mafragh)
  s.label(mafragh$xy, inc = FALSE, neig = mafragh$neig, addax = FALSE)
  data(irishdata)
  s.label(irishdata$xy, inc = FALSE, contour = irishdata$contour, 
    addax = FALSE)
  
  par(mfrow = c(2, 2))
  cha <- ls()
  s.label(cbind.data.frame(runif(length(cha)), 
    runif(length(cha))), lab = cha)
  x <- runif(50, -2, 2)
  y <- runif(50, -2, 2)
  z <- x^2 + y^2
  s.label(data.frame(x, y), lab = as.character(z < 1))
  s.label(data.frame(x, y), clab = 0, cpoi = 1, add.plot = TRUE)
  symbols(0, 0, circles = 1, add = TRUE, inch = FALSE)
  s.label(cbind.data.frame(runif(100, 0, 10), runif(100, 5, 12)), 
    incl = FALSE, clab = 0)
  s.label(cbind.data.frame(runif(100, -3, 12),
    runif(100, 2, 10)), cl = 0, cp = 2, include = FALSE)
}


