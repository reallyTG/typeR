library(sendplot)


### Name: addDefault
### Title: ADDS DEFAULT TOOL-TIP REGION
### Aliases: addDefault
### Keywords: methods

### ** Examples


library(sendplot)
library(rtiff)

# sets up matrix for layout
mat = matrix(1,nrow=12, ncol=13)
mat[9:12,] = 2
mat[,9:13] = 3
mat[1:2,] = 4

# sets up figure margins
mai.mat = matrix(.5,ncol=4,nrow=4)

# vector of image values
myX = c(-1,-10,1,10,-5,0)

# plot calls
plot.calls = c("boxplot(count ~ spray, data = InsectSprays, col = 'lightgray')", "plot(1:3,1:3, col='blue', xlab='', ylab=''); points(1:2, 2:3, col='red')", "image(1:2,1:3, z=matrix(myX,ncol=3,nrow=2), xlab='', ylab='')","plot(cos, xlim = c(-pi,3*pi), n = 1001, col = 'blue', xlab='', ylab='')" )
plt.extras=list(figure1= "rect(xleft=c(3,1), ytop=c(25,5),xright=c(4,2),  ybottom=c(20,0));title(main='A', cex=3)", figure2="polygon(x=c(2,2.5,3,2.5), y=c(1,2.5,1,1.5));title(main='B', cex=3)", figure3 ="title(main='C', cex=3)", figure4="title(main='D', cex=3)")


# initialize Splot object
Splot = initSplot(mat, plot.calls, mai.mat = mai.mat,plot.extras =plt.extras)

# add default
Splot = addDefault(Splot, data=c("This is default", "data2"), data.labels=c("label", "d2"), links=c("http://www.buffalo.edu, http://www.bioinformatics.buffalo.edu", "http://www.bioinformatics.buffalo.edu"), links.labels=c("hyp1", "hyp2"),font.size=10, font.type="arial", bg.color="gray", font.color="yellow")



#set up temporary directory
direct = paste(tempdir(),"/",sep="")
direct


# make plot that has interactive default 
Splot = makeSplot(Splot, fname.root="exToy",dir=direct, returnObj=TRUE)




