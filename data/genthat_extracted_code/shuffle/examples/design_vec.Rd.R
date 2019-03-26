library(shuffle)


### Name: design_vec
### Title: The design for an fMRI experiment
### Aliases: design_vec
### Keywords: datasets

### ** Examples

data(design_vec)
plot(design_vec,xlab = "event", ylab = "treatment", main="Design of the full experiment" )

plot(design_vec[1:120],xlab = "event",ylab= "treatment",main="Design of a single block")



