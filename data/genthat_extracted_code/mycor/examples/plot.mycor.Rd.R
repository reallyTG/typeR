library(mycor)


### Name: plot.mycor
### Title: Plot for an object of class "mycor"
### Aliases: plot.mycor

### ** Examples

 out=mycor(iris)
 plot(out)
 plot(out, groups=Species)
 plot(out,type=2,groups=species)
 out1=mycor(mtcars[1:5],alternative="greater",methods="kendall",
            conf.level=0.95)
 plot(out1,type=3)
 plot(out1,type=4,groups=cyl)



