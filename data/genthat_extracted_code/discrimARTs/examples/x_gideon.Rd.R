library(discrimARTs)


### Name: x_gideon
### Title: Horn measurements of the rhinoceros beetle _Xylotrupes_ gideon.
### Aliases: x_gideon
### Keywords: datasets

### ** Examples

data(x_gideon)
## Scatter plot of horn versus body showing trait scaling
plot(x_gideon$horn, x_gideon$body)

## Plot histogram with overlaid density plot
hist(x_gideon$horn, freq=FALSE)
points( x_gideon$horn, rep(0, nrow(x_gideon)))

## Estimation of mixture of normals
fit.gideon <- mix.mle(x_gideon$horn, method='normal', 
    mix.prob=0.5, dist1.par1=100, dist1.par2=10, dist2.par1=300, dist2.par2=10)

print(fit.gideon)
plot(fit.gideon)



