library(hbm)


### Name: add.noise
### Title: Add Noise to a Symmetric Association Matrix
### Aliases: add.noise

### ** Examples

set.seed(2)
n = 200 # chain size
conf = generate.random.conf(n, sd = 0.5, scale = FALSE)
# generate a contact map -like matrix using the model c ~ exp(-d)
control = exp(-1*as.matrix(dist(conf)))
# add noise 
control.noisy = add.noise(control, factor = 5)




