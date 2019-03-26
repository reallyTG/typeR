library(PairedData)


### Name: IceSkating
### Title: Ice skating speed study
### Aliases: IceSkating
### Keywords: datasets

### ** Examples

data(IceSkating)

# Nothing particular in the paired plot
with(IceSkating,plot(paired(Extension,Flexion),type="McNeil"))

# The differences are normally distributed
with(IceSkating,qqnorm(Extension-Flexion))
with(IceSkating,qqline(Extension-Flexion))

# Usual t test
with(IceSkating,t.test(paired(Extension,Flexion)))



