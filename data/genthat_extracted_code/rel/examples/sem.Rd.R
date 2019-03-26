library(rel)


### Name: sem
### Title: Standard error of measurement
### Aliases: sem
### Keywords: univar

### ** Examples

#Sample data: 200 subjects rated their weight twice.
data <- cbind(sample(50:100,200,replace=TRUE), sample(50:100,200,replace=TRUE))

#Standard error of measurement
sem(data=data, type="mse", conf.level=0.95)



