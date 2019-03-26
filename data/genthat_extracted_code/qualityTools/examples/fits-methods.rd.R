library(qualityTools)


### Name: fits-methods
### Title: Get and set methods
### Aliases: fits fits<- fits-methods fits,facDesign-method
###   fits<-,facDesign-method

### ** Examples

#create response surface design
fdo = rsmDesign(k = 2, blocks = 2, alpha = "both")

#set two responses for the response surface designs
response(fdo) = data.frame(y= rnorm(14, 12, sd =  2), 
                           y2 =  -2*fdo[,4]^2 - fdo[,5]^2 + rnorm(14, 12))

#set a fit for each response
fits(fdo) = lm(y ~ A*B , data = fdo)
fits(fdo) = lm(y2 ~ A*B + I(A^2) + I(B^2), data = fdo)

#get the fitted response for y2
fits(fdo)[["y2"]]




