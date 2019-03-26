library(discrimARTs)


### Name: o_taurus
### Title: Horn measurements of the dung beetle Onthophagus taurus.
### Aliases: o_taurus
### Keywords: datasets

### ** Examples

data(o_taurus)
## Scatter plot of horn versus body showing trait scaling
plot(o_taurus$horn, o_taurus$body)

## Plot histogram with observations 
hist(o_taurus$horn, freq=FALSE)
## To include points on x-axis of histogram
points( o_taurus$horn, rep(0, nrow(o_taurus)))

## use the o_taurus dataset to estimate facing gamma
## Using an offset to shift data away from zero
horn.offset <- 8
taurus.fit <- mix.mle(input=o_taurus$horn+horn.offset, method='facing.gamma', 
    mix.prob=0.59, lower=2 + horn.offset - 7, upper=482 + horn.offset + 3, 
    dist1.par1=1.37, dist1.par2=52.7, dist2.par1=2.29, dist2.par2=43.8)
## Default printing function shows a subset of the available information
print(taurus.fit)
## Default plotting function shows histogram, raw observations, and the computed distributions,
## along with a legend including estimated values
plot(taurus.fit)
## To exclude legend
plot(taurus.fit, legend=FALSE)



