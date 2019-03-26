library(zipfR)


### Name: spc
### Title: Frequency Spectra (zipfR)
### Aliases: spc spc.object
### Keywords: classes

### ** Examples


## load Brown imaginative prose spectrum and inspect it
data(BrownImag.spc)

summary(BrownImag.spc)
print(BrownImag.spc)

plot(BrownImag.spc)

N(BrownImag.spc)
V(BrownImag.spc)
Vm(BrownImag.spc,1)
Vm(BrownImag.spc,1:5)

## compute ZM model, and generate PARTIAL expected spectrum
## with variances for a sample of 10 million tokens
zm <- lnre("zm",BrownImag.spc)
zm.spc <- lnre.spc(zm,1e+7,variances=TRUE)

## inspect extrapolated spectrum
summary(zm.spc)
print(zm.spc)

plot(zm.spc,log="x")

N(zm.spc)
V(zm.spc)
VV(zm.spc)
Vm(zm.spc,1)
VVm(zm.spc,1)

## generate an artificial Zipfian-looking spectrum
## and take a look at it
zipf.spc <- spc(round(1000/(1:1000)^2))

summary(zipf.spc)
plot(zipf.spc)

## see manpages of lnre, and the various *.spc mapages
## for more examples of spc usage




