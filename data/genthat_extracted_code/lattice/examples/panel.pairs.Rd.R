library(lattice)


### Name: F_1_panel.pairs
### Title: Default Superpanel Function for splom
### Aliases: panel.pairs diag.panel.splom
### Keywords: dplot

### ** Examples


Cmat <- outer(1:6,1:6,
              function(i,j) rainbow(11, start=.12, end=.5)[i+j-1])

splom(~diag(6), as.matrix = TRUE,
      panel = function(x, y, i, j, ...) {
          panel.fill(Cmat[i,j])
          panel.text(.5,.5, paste("(",i,",",j,")",sep=""))
      })




