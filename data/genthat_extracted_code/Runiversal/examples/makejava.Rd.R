library(Runiversal)


### Name: makejava
### Title: A wrapper function for converting R objects to Java style
###   variables.
### Aliases: makejava
### Keywords: convert java

### ** Examples

#Shows the linear regression results as Java style variables
y<-rnorm(10)
x<-1:10
ols<-lm(y~x)
cat(makejava(ols))

#Shows only the residuals as double[] Residuals=new double[]{.....};
cat(makejava(ols$residuals, "Residuals"))





