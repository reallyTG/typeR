library(fossil)


### Name: sac
### Title: Calculate Species Area Curves
### Aliases: sac
### Keywords: datagen

### ** Examples

#fdata species/area relationship
data(fdata.lats)
data(fdata.mat)
a<-sac(fdata.lats, fdata.mat)
plot(log(a$areavsspp))



