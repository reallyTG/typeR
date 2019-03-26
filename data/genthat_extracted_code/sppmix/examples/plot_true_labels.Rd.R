library(sppmix)


### Name: plot_true_labels
### Title: Plot the true membership indicators
### Aliases: plot_true_labels

### ** Examples

## No test: 
truemix <- rnormmix(m = 5, sig0 = .1, df = 5, xlim= c(-3, 3), ylim = c(-3, 3))
intsurf=to_int_surf(truemix, lambda = 100, win =spatstat::owin( c(-3, 3),c(-3, 3)))
pp1 <- rsppmix(intsurf,FALSE)
plot_true_labels(pp1)
## End(No test)




