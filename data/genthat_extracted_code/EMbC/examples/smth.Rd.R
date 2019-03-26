library(EMbC)


### Name: smth
### Title: Posterior smoothing of single local labels.
### Aliases: smth smth,binClst-method smth,binClstStck-method

### ** Examples

# -- cluster the example path with a prior smooth of 1 hour --
mysmoothbcp <- stbc(expth,smth=1,info=-1)
# -- apply a posterior smoothing --
mysmoothbcpsmoothed <- smth(mysmoothbcp,dlta=0.5)



