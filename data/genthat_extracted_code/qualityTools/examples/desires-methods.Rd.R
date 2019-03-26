library(qualityTools)


### Name: desires-methods
### Title: Get and set methods
### Aliases: desires desires<- desires-methods desires,facDesign-method
###   desires<-,facDesign-method
### Keywords: Multiple Response Optimization

### ** Examples

#create a response surface design
fdo = rsmDesign(k = 2, blocks = 2, alpha = "both")

#set two responses for the response surface designs
response(fdo) = data.frame(y= rnorm(14, 12, sd =  2), 
                           y2 =  -2*fdo[,4]^2 - fdo[,5]^2 + rnorm(14, 12))

#set a fit for each response
fits(fdo) = lm(y ~ A*B , data = fdo)
fits(fdo) = lm(y2 ~ A*B + I(A^2) + I(B^2), data = fdo)

#define a desirability for response y
d = desirability(y, 6, 18, scale = c(0.5, 2), target = 12)

#plot the desirability function
plot(d)

#set the desirability for y and y2 in the factorial design fdo
desires(fdo) = d
desires(fdo) = desirability(y2, 6, 18, scale = c(1, 1), target = "min")
desires(fdo)



