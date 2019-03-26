library(gplots)


### Name: ooplot.default
### Title: Create an OpenOffice style plot
### Aliases: ooplot.default ooplot
### Keywords: hplot

### ** Examples

     data(VADeaths, package = "datasets")

     VADeaths <- cbind( Age=c(50,55,60,65,70), VADeaths)

     mp <- ooplot(VADeaths) # default
     mp <- ooplot(VADeaths, type="xyplot")  # same as default
     mp <- ooplot(VADeaths, type="linear")  # linear scale
     mp <- ooplot(VADeaths, type="linear", log="y") # log scale on y axis
     mp <- ooplot(VADeaths, type="barplot") # barplot
     mp <- ooplot(VADeaths, type="stackbar") # stacked


     tot <- colMeans(VADeaths[,-1])
     ooplot(VADeaths, 
             col = c("lightblue", "mistyrose", "lightcyan", "lavender"),
             legend = colnames(VADeaths)[-1], ylim = c(0, 100),
             type="barplot", cex.values=0.75)
     title(main = "Death Rates in Virginia", font.main = 4)


     ##
     ## Capability demo
     ##
     ## examples for the ooplot routine
     ##
     ## create some test data
     test1 <- data.frame(x=c(0,1,2,3,4), lin=c(0,1,2,3,4))
     test2 <- data.frame(x=c(0,1,2,3,4), par=c(0,1,4,9,16))
     test3 <- data.frame(x=c(-2,-1,0,1,2),y2=c(4,1,0,1,4))
     ## single line test example
     test1f <- test1
     ## two column example
     test2f <- merge(test1,test2,by.x="x",all=TRUE,sort=TRUE)
     ## three column example
     test3f <- merge(test2f,test3,by.x="x",all=TRUE,sort=TRUE)
     ## subset, single row, example
     test5r <- test3f[5,]  
     
     ##
     ## xyplot, linear, barplot, stackbar
     mat <- matrix(c(1:16),4,4,byrow=TRUE)
     layout(mat)
     
     ooplot(test1f,type="barplot",col=c("red"))
     title(main="barplot")
     ooplot(test2f,type="barplot",col=c("red","blue"))
     ooplot(test3f,type="barplot",col=c("red","blue","green"))
     ooplot(test5r,type="barplot",col=c("red","blue","green"))
     
     ooplot(test1f,type="xyplot",col=c("red"))
     title(main="xyplot")
     ooplot(test2f,type="xyplot",col=c("red","blue"))
     ooplot(test3f,type="xyplot",col=c("red","blue","green"))
     ooplot(test5r,type="xyplot",col=c("red","blue","green"))
     
     ooplot(test1f,type="linear",col=c("red"))
     title(main="linear")
     ooplot(test2f,type="linear",col=c("red","blue"))
     ooplot(test3f,type="linear",col=c("red","blue","green"))
     ooplot(test5r,type="linear",col=c("red","blue","green"))
     
     ooplot(test1f,type="stackbar",col=c("red"))
     title(main="stackbar")
     ooplot(test2f,type="stackbar",col=c("red","blue"))
     ooplot(test3f,type="stackbar",col=c("red","blue","green"))
     ooplot(test5r,type="stackbar",col=c("red","blue","green"))

     # restore default layout (1 plot/page)
     layout(1)



