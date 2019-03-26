library(jcolors)


### Name: jcolors_contin
### Title: continuous palettes of colors for figures
### Aliases: jcolors_contin

### ** Examples


colfunc <- jcolors_contin()
jcols   <- colfunc(1000)
n       <- length(jcols)
image(1:n, 1, as.matrix(1:n),
      col  = jcols,
      xlab = "", ylab = "",
      xaxt = "n", yaxt = "n", bty = "n")




