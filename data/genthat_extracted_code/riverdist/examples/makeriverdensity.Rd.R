library(riverdist)


### Name: makeriverdensity
### Title: Calculate Kernel Density Using River Distance
### Aliases: makeriverdensity

### ** Examples

data(Gulk, fakefish)

Gulk_dens <- makeriverdensity(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, 
  survey=fakefish$flight.date)
  
# # 10 plots will be created, recommend calling par(mfrow=c(2,5))
plot(x=Gulk_dens)



