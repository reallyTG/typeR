library(TRSbook)


### Name: flashy.plot
### Title: A flashy scatter plot
### Aliases: flashy.plot

### ** Examples

data(NUTRIELDERLY)
attach(NUTRIELDERLY)
gender <- as.factor(gender)
levels(gender) <- c("Male","Female")
flashy.plot(weight,height,gender,xlab="Height",ylab="Weight")
detach(NUTRIELDERLY)



