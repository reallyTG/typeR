library(TED)


### Name: cbfs
### Title: Generate an artificial event with white noise
### Aliases: cbfs

### ** Examples

# generate a box function with white noise
set.seed(123)
x1 = cbfs(type = 'box', sigma = 1)
# generate a box function with higher level noise
set.seed(123)
x2 = cbfs(type = 'box', sigma = 3)
# plot them
par(mfrow=c(1,2))
plot(x1,type='l',xlab='t',ylab=expression(x[1]))
plot(x2,type='l',xlab='t',ylab=expression(x[2]))



