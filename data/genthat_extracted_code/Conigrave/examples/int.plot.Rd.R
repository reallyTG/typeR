library(Conigrave)


### Name: int.plot
### Title: Interaction plot
### Aliases: int.plot

### ** Examples

carsdata<-mtcars
int.plot(carsdata,"mpg","disp","cyl", y.lim = c(-2.5,2.5))
int.plot(carsdata,"mpg","disp", c("cyl","am"), y.lim = c(-5.0,2.0))



