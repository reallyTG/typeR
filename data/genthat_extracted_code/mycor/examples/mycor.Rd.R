library(mycor)


### Name: mycor
### Title: Perform correlation and linear regression for a data.frame
###   automatically
### Aliases: mycor mycor.default mycor.formula

### ** Examples

out=mycor(iris)
plot(out)
plot(out, groups=Species)
plot(out,type=2,groups=species)
plot(out,type=4,groups=species)
out1=mycor(~mpg+disp+wt+hp,data=mtcars,alternative="greater",methods="kendall",
            conf.level=0.95)
plot(out1,type=3)
plot(out1,type=4,groups=cyl)



