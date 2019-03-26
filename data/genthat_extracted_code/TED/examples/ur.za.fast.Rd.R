library(TED)


### Name: ur.za.fast
### Title: Unit root test for events considering a structrual break
### Aliases: ur.za.fast

### ** Examples

# this is a box function
set.seed(123)
x=cbfs_red('box')
ur.za.fast(x,'both')
# this is a cliff-ramp
set.seed(123)
x=cbfs_red('cr')
ur.za.fast(x,'both')
# this is a random walk process
set.seed(123)
x=cumsum(rnorm(300))
ur.za.fast(x,'both')



