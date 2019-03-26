library(PTXQC)


### Name: plot_MS2Decal
### Title: Plot bargraph of oversampled 3D-peaks.
### Aliases: plot_MS2Decal

### ** Examples

  n = c(100, 130, 50)
  data = data.frame(file = repEach(paste(letters[1:3],"\nLTQ [Da]"), n),
                    msErr = c(rnorm(n[1], 0.5), rnorm(n[2], 0.0), rnorm(n[3], -0.5)),
                    type = c("forward", "decoy")[1+(runif(sum(n))>0.95)])
  plot_MS2Decal(data)




