library(PersomicsArray)


### Name: plot_low_res
### Title: plot_low_res
### Aliases: plot_low_res

### ** Examples

# load example image data from package
data("PersomicsPlate")

# isolate single color channel
red <- example_plate[,,1]

# plot low resolution image of
plot_low_res(red, rescale.factor=10)



