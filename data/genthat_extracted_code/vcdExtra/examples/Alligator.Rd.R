library(vcdExtra)


### Name: Alligator
### Title: Alligator Food Choice
### Aliases: Alligator
### Keywords: datasets

### ** Examples

data(Alligator)

# change from frequency data.frame to table
allitable <- xtabs(count~lake+sex+size+food, data=Alligator)
# Agresti's Table 7.1
structable(food~lake+sex+size, allitable)


plot(allitable, shade=TRUE)
# mutual independence model
mosaic(~food+lake+size, allitable, shade=TRUE)
# food jointly independent of lake and size
mosaic(~food+lake+size, allitable, shade=TRUE, expected=~lake:size+food)

if (require(nnet)) {
	# multinomial logit model
	mod1 <- multinom(food ~ lake+size+sex, data=Alligator, weights=count)
}




