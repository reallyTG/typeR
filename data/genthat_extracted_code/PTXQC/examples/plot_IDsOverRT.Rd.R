library(PTXQC)


### Name: plot_IDsOverRT
### Title: Plot IDs over time for each Raw file.
### Aliases: plot_IDsOverRT

### ** Examples

 data = data.frame(fc.raw.file = rep(paste('file', letters[1:3]), each=30),
                            RT = seq(20, 120, length.out = 30),
                        counts = c(rnorm(30, 400, 20), rnorm(30, 250, 15), rnorm(30, 50, 15)))
 plot_IDsOverRT(data)




