library(usl)


### Name: predict,USL-method
### Title: Predict method for Universal Scalability Law models
### Aliases: predict,USL-method

### ** Examples

require(usl)

data(raytracer)

## Print predicted result from USL model for demo dataset
predict(usl(throughput ~ processors, raytracer))

## The same prediction with confidence intervals at the 99% level
predict(usl(throughput ~ processors, raytracer),
        interval = "confidence", level = 0.99)




