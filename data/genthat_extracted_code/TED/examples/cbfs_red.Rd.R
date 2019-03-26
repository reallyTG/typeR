library(TED)


### Name: cbfs_red
### Title: Generate an artificial event with red noise
### Aliases: cbfs_red

### ** Examples

# generate a box function with red noise
set.seed(123)
x = cbfs_red(type = 'box', coeff=0.5, s=1, A=10)
# plot it
plot(x,type='l',xlab='t',ylab='x')



