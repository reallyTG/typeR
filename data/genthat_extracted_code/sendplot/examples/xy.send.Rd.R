library(sendplot)


### Name: xy.send
### Title: INTERACTIVE SCATTERPLOT
### Aliases: xy.send
### Keywords: methods

### ** Examples


library(sendplot)
library(rtiff)


plot.call=c("plot(mtcars$hp,mtcars$mpg,xlab='gross horsepower',
                   ylab='miles per gallon',axes=FALSE,pch=mtcars$cyl,
                   col=mtcars$am+1,cex=0.875,
                   main='Motor Trend Car Road Tests')")

plot.extras=c("axis(1);axis(2);
              legend(200,25,pch=rep(c(4,6,8),2),col=c(rep(1,3),rep(2,3)),
                     legend=paste(rep(c(4,6,8),2),'cylinders,',
                              c('automatic','manual')[c(rep(1,3),rep(2,3))]),cex=0.875)")


#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct


xy.send(plot.call=plot.call,
       y.pos=mtcars$mpg,x.pos=mtcars$hp,
       xy.labels = data.frame(name=rownames(mtcars),mtcars=mtcars), 
       plot.extras=plot.extras,
       image.size="800x600",
       fname.root="exPlotXY", dir = direct, font.size=18)






