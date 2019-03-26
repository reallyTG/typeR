library(UsingR)


### Name: kid.weights
### Title: Weight and height measurement for a sample of U.S. children
### Aliases: kid.weights
### Keywords: datasets

### ** Examples

data(kid.weights)
attach(kid.weights)
plot(weight,height,pch=as.character(gender))
## find the BMI -- body mass index
m.ht = height*2.54/100        # 2.54 cm per inch
m.wt = weight / 2.2046        # 2.2046 lbs. per kg
bmi = m.wt/m.ht^2
hist(bmi)



