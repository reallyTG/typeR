library(npsm)


### Name: latour
### Title: Chateau Latour Wine Data
### Aliases: latour
### Keywords: datasets

### ** Examples

data(latour)
plot(quality~end.of.harvest,pch='',data=latour)
points(quality~end.of.harvest,data=latour[latour$rain==0,],pch=3)
points(quality~end.of.harvest,data=latour[latour$rain==1,],pch=4)



