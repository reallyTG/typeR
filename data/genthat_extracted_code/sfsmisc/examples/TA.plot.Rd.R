library(sfsmisc)


### Name: TA.plot
### Title: Tukey-Anscombe Plot (Residual vs. Fitted) of a Linear Model
### Aliases: TA.plot
### Keywords: models regression

### ** Examples

data(stackloss)
TA.plot(lm(stack.loss ~ stack.x))

example(airquality)
summary(lmO <- lm(Ozone ~ ., data= airquality))
TA.plot(lmO)
TA.plot(lmO, label = "O") # instead of case numbers

if(FALSE) { 
 TA.plot(lm(cost ~ age+type+car.age, claims, weights=number, na.action=na.omit))
}

##--- for  aov(.) : -------------
data(Gun, package = "nlme")
TA.plot( aov(rounds ~ Method + Physique/Team, data = Gun))

##--- Not so clear what it means for GLM, but: ------
if(require(rpart)) { # for the two datasets only
 data(solder, package = "rpart")
 TA.plot(glm(skips ~ ., data = solder, family = poisson), cex= .6)

 data(kyphosis, package = "rpart")
 TA.plot(glm(Kyphosis ~ poly(Age,2) + Start, data=kyphosis, family = binomial),
	 cex=.75) # smaller title and plotting characters
}



