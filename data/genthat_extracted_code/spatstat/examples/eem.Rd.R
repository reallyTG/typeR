library(spatstat)


### Name: eem
### Title: Exponential Energy Marks
### Aliases: eem
### Keywords: spatial models

### ** Examples

    data(cells)
    fit <- ppm(cells, ~x, Strauss(r=0.15))
    ee <- eem(fit)
    sum(ee)/area(Window(cells)) # should be about 1 if model is correct
    Y <- setmarks(cells, ee)
    plot(Y, main="Cells data\n Exponential energy marks")



