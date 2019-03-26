library(EDFIR)


### Name: heatmap.samples
### Title: heatmap.samples
### Aliases: heatmap.samples

### ** Examples

## get the input from a file, where the predator measurements are simple
## raw isotopic measurements, and prey measurements are in mean/sd form
## Heatmap.samples assumes only two isotopes are measured!
## Not run: 
##D input <- build.isotopeframe("predator measurements.dat",
##D "prey measurements.dat")
## End(Not run)

## now get 2000 samples of discrimination factors
## Not run: 
##D out <- estimate.shiftvec(input$pred.frame, input$prey.frame,
##D  num.samples=2000, pred.distinput=FALSE, prey.distinput=TRUE)
## End(Not run)

## now visualize
## Not run: heatmap.samples(out)



