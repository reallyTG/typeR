library(latentnet)


### Name: ergmm.drawpie
### Title: Draw a pie chart at a specified location.
### Aliases: ergmm.drawpie
### Keywords: graphs

### ** Examples


plot(c(0,sum(1:11))*2,c(-10,10),type="n",asp=1)
for(i in 1:10) ergmm.drawpie(c(sum(1:i)*2,0), radius=i, probs=1:(i+1))




