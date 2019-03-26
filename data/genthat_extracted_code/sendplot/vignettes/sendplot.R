### R code from vignette source 'sendplot.Rnw'

###################################################
### code chunk number 1: sendplot.Rnw:88-89
###################################################
library(sendplot)


###################################################
### code chunk number 2: sendplot.Rnw:94-96
###################################################
direct=paste(tempdir(),"/",sep="")
direct


###################################################
### code chunk number 3: sendplot.Rnw:164-168
###################################################
plot.call=c("plot(x.pos,y.pos,xlab='gross horsepower',
                   ylab='miles per gallon',axes=F,pch=mtcars$cyl,
                   col=mtcars$am+1,cex=0.875,
                   main='Motor Trend Car Road Tests');axis(1)")


###################################################
### code chunk number 4: sendplot.Rnw:184-188
###################################################
plot.extras=c("axis(2);
              legend(200,25,pch=rep(c(4,6,8),2),col=c(rep(1,3),rep(2,3)),
                     legend=paste(rep(c(4,6,8),2),'cylinders,',
                              c('automatic','manual')[c(rep(1,3),rep(2,3))]),cex=0.875)")


###################################################
### code chunk number 5: sendplot.Rnw:207-209
###################################################
y.pos=mtcars$mpg
x.pos=mtcars$hp


###################################################
### code chunk number 6: sendplot.Rnw:219-220
###################################################
xy.labels = data.frame(name=rownames(mtcars),mtcars=mtcars)


###################################################
### code chunk number 7: sendplot.Rnw:244-251
###################################################

  xy.send(plot.call=plot.call,
       y.pos=y.pos,x.pos=x.pos,
       xy.labels = xy.labels, 
       plot.extras=plot.extras,
       image.size="800x600",dir=direct,
       fname.root="exPlotXY", font.size=18)


###################################################
### code chunk number 8: sendplot.Rnw:381-391
###################################################

carsX  = as.matrix(mtcars)
carsX <- sweep(carsX, 2, colMeans(carsX, na.rm = T))
        sx <- apply(carsX, 2, sd, na.rm = T)
        carsX <- sweep(carsX, 2, sx, "/")

x = 1:dim(carsX)[2]
y = 1:dim(carsX)[1]
z = t(carsX)



###################################################
### code chunk number 9: sendplot.Rnw:403-404
###################################################
plot.call = "image(x=1:dim(carsX)[2],y=1:dim(carsX)[1], z=t(carsX),axes = FALSE, xlab = '', ylab = '');axis(1,1:dim(carsX)[2], labels=colnames(carsX),las = 2, line = -0.5, tick = 0,cex.axis =1); axis(4,1:dim(carsX)[1], labels=rownames(carsX),las = 2, line = -0.5, tick = 0,cex.axis =.8)"


###################################################
### code chunk number 10: sendplot.Rnw:429-431
###################################################
mai.mat = matrix(c(1,.2,.2,1.5), ncol=4)
mai.prc = FALSE


###################################################
### code chunk number 11: sendplot.Rnw:462-476
###################################################
xy.labels=list(value=round(carsX,3))

x.labels=data.frame(label=colnames(carsX),
  description=c("Miles/(US) gallon","Number of cylinders",
    "Displacement (cu.in.)",
    "Gross horsepower",
    "Rear axle ratio",
    "Weight (lb/1000)",
    "1/4 mile time",
    "V/S",
    "Transmission (0 = automatic, 1 = manual)",
    "Number of forward gears",
    "Number of carburetors")
  )


###################################################
### code chunk number 12: sendplot.Rnw:493-502
###################################################

  imagesend(plot.call=plot.call,
       y.pos=y,x.pos=x,
       mai.mat=mai.mat, mai.prc=mai.prc,
       xy.type="image.midpoints",
       x.labels=x.labels,
       xy.labels = xy.labels, 
       image.size="800x600",dir=direct,
       fname.root="exPlotImage", font.size=18)


###################################################
### code chunk number 13: sendplot.Rnw:669-670
###################################################
x  = as.matrix(mtcars)


###################################################
### code chunk number 14: sendplot.Rnw:704-718
###################################################
xy.labels=list(value=x)

x.labels=data.frame(label=colnames(x),
  description=c("Miles/(US) gallon","Number of cylinders",
    "Displacement (cu.in.)",
    "Gross horsepower",
    "Rear axle ratio",
    "Weight (lb/1000)",
    "1/4 mile time",
    "V/S",
    "Transmission (0 = automatic, 1 = manual)",
    "Number of forward gears",
    "Number of carburetors")
  )


###################################################
### code chunk number 15: sendplot.Rnw:733-735
###################################################
rc = rainbow(nrow(x), start=0, end=.3)
cc = rainbow(ncol(x), start=0, end=.3)


###################################################
### code chunk number 16: sendplot.Rnw:747-755
###################################################

 heatmap.send(x,scale="column", xy.labels = xy.labels,
                 x.labels=x.labels,
                 RowSideColors = rc, ColSideColors = cc, margin=c(5,10),
                 xlab = "specification variables", ylab= "Car Models",
                 main = "mtcars data", dir=direct,
                 fname.root="exHeat", font.size=18,image.size="600x900")



###################################################
### code chunk number 17: sendplot.Rnw:931-936
###################################################
mat = matrix(c(rep(c(rep(4,8),rep(0,5)),2),
               rep(c(rep(1,8),rep(3,5)),6),
               rep(c(rep(2,8),rep(3,5)),4)),
               byrow=T, ncol=13)
mat


###################################################
### code chunk number 18: sendplot.Rnw:969-971
###################################################

plot.calls = c("boxplot(count ~ spray, data = InsectSprays, col = 'lightgray')", "plot(1:3,1:3, col='blue', xlab='', ylab=''); points(1:2, 2:3, col='red')", "image(1:2,1:3, z=matrix(myX,ncol=3,nrow=2), xlab='', ylab='')","plot(cos, xlim = c(-pi,3*pi), n = 1001, col = 'blue', xlab='', ylab='')" )


###################################################
### code chunk number 19: sendplot.Rnw:980-981
###################################################
myX = c(-1,-10,1,10,-5,0)


###################################################
### code chunk number 20: sendplot.Rnw:1063-1065
###################################################
mai.mat = matrix(.5,ncol=4,nrow=4)
mai.prc = FALSE


###################################################
### code chunk number 21: sendplot.Rnw:1086-1088
###################################################
plot.extras=list(figure1= "rect(xleft=c(3,1), ytop=c(25,5),xright=c(4,2),  ybottom=c(20,0));title(main='A', cex=3)", figure2="polygon(x=c(2,2.5,3,2.5), y=c(1,2.5,1,1.5));title(main='B', cex=3)", figure3 ="title(main='C', cex=3)", figure4="title(main='D', cex=3)")



###################################################
### code chunk number 22: sendplot.Rnw:1097-1101
###################################################
figure2=list(c("polygon(x=c(2,2.5,3,2.5), y=c(1,2.5,1,1.5))"),
                 c( "title(main='B', cex=3)"))
figure2
 


###################################################
### code chunk number 23: sendplot.Rnw:1168-1169
###################################################
Splot = initSplot(mat, plot.calls, mai.mat = mai.mat,plot.extras=plot.extras)


###################################################
### code chunk number 24: sendplot.Rnw:1183-1185
###################################################
Splot = makeSplot(Splot, fname.root="FirstLookEx", dir=direct,
                  makeInteractive=FALSE, returnObj=TRUE)


###################################################
### code chunk number 25: sendplot.Rnw:1310-1312
###################################################
 xvec = 1:6
 yvec = Splot$plot.output[[1]]$stats[3,]


###################################################
### code chunk number 26: sendplot.Rnw:1324-1326
###################################################
x.lbls = as.data.frame(matrix(c("boxplot.group1","boxplot.group2","boxplot.group3","boxplot.group4","boxplot.group5","boxplot.group6", as.character(yvec),"not a link", "not a link", "im a link", "im a link", "not a link", "not a link"), ncol=3))
names(x.lbls) = c("x.Label.1","x.Label.2", "asLinks")  


###################################################
### code chunk number 27: sendplot.Rnw:1343-1347
###################################################
x.links = as.data.frame(matrix(rep(NA, 12), nrow=6))
x.links[1:3,1] = "http://www.buffalo.edu"
x.links[,2] = "http://www.buffalo.edu, http://www.bioinformatics.buffalo.edu/"
names(x.links) = c("link.1", "link.2")


###################################################
### code chunk number 28: sendplot.Rnw:1359-1360
###################################################
asLinks = c(NA, NA, "http://sphhp.buffalo.edu/biostat/", "http://sphhp.buffalo.edu/biostat/", NA, NA)


###################################################
### code chunk number 29: sendplot.Rnw:1371-1375
###################################################
Splot = makeImap(Splot, figure=1, xy.type="points", 
                 x.pos=xvec, y.pos=yvec,
                 x.labels = x.lbls, asLinks = asLinks, x.links=x.links, 
                 fname.root="sendPlotEx", dir=direct, spot.radius=25)


###################################################
### code chunk number 30: sendplot.Rnw:1399-1406
###################################################
Splot = makeImap(Splot, figure=1, xy.type="circle", x.pos=Splot$plot.output[[1]]$group[1], y.pos=Splot$plot.output[[1]]$out[1],
                 x.labels = list(Xlabel1.xyType="point", Xlabel2.asLinks="im a link"),
                 y.labels = list(ylabel1.yValue="7", tooltip.font="arial",tooltip.size="20",  tooltip.fontcolor="hotpink",tooltip.background="blue"),
                 asLinks = "http://www.buffalo.edu", 
                 fname.root="sendPlotEx", spot.radius=20, dir=direct,
                 font.type="arial", font.size="20", font.color="hotpink", bg.color="blue")



###################################################
### code chunk number 31: sendplot.Rnw:1447-1456
###################################################
x.links = as.data.frame(matrix(rep(NA, 6), nrow=2))
x.links[1,1] = "http://www.buffalo.edu"
x.links[,2] = "http://www.buffalo.edu, http://www.bioinformatics.buffalo.edu/"
x.links[2,3] = "http://sphhp.buffalo.edu/biostat/"
names(x.links) = c("UB", "buildings", "stats")


Splot = makeImap(Splot, figure=1, xy.type="rect", x.pos=c(3,1), y.pos=c(25,5),x.right.pos=c(4,2),  y.bottom.pos=c(20,0),  x.labels = as.data.frame(list(Xlabel.1=c("rect.1","rect.2"), Xlabel.2.coordinates=c("3,20-3,25-4,25-4,20","1,0-1,5-2,5-2,0"),asLinks=c("im a link", "im a link"))),y.labels = list(tooltip.size=c("15","15"), tooltip.fontcolor=c("cyan","cyan"), tooltip.background=c("black","black")),  asLinks = "http://sphhp.buffalo.edu/biostat/", fname.root="sendPlotEx", dir=direct, x.links=x.links, font.size=15, font.color="cyan", bg.color="black")



###################################################
### code chunk number 32: sendplot.Rnw:1516-1529
###################################################
x.lbls = as.data.frame(list(xLabel1.xyType=c("point1", "point2", "point3"),
                            xLabel2.asLinks=c("im a link", "im a link", "im a link")))
y.links = as.data.frame(matrix(rep(NA, 9), nrow=3))
y.links[1:2,1] = "http://www.buffalo.edu"
y.links[2:3,2] = "http://www.buffalo.edu, http://www.bioinformatics.buffalo.edu/"
y.links[,3] = "http://sphhp.buffalo.edu/biostat/"
names(y.links) = c("UB", "building", "department")
asLinks=c("http://www.buffalo.edu","http://www.bioinformatics.buffalo.edu/","http://sphhp.buffalo.edu/biostat/")

Splot = makeImap(Splot, figure=2, xy.type="circle", x.pos=1:3, y.pos=1:3, y.labels = list(tooltip.fontcolor=c("green", "green", "green"),tooltip.size=c("14", "14", "14"),  tooltip.background=c("transparent", "transparent", "transparent")), asLinks = asLinks, x.labels = x.lbls,
                 fname.root="sendPlotEx", y.links=y.links,dir=direct,
                 bb.cex=5, spot.radius=20, font.color="green",bg.color="", font.size="14" )



###################################################
### code chunk number 33: sendplot.Rnw:1569-1573
###################################################

y.lbls = as.data.frame(list(xLabel1.xyType=c("point1", "point2"), xLabel2.asLinks=c("im not a link", "im not a link")))
Splot = makeImap(Splot, figure=2, xy.type="circle", x.pos=1:2, y.pos=2:3, x.labels = list(tooltip=c("default settings", "default settings")), y.labels = y.lbls,fname.root="sendPlotEx", bb.cex=5,spot.radius=15, dir=direct)



###################################################
### code chunk number 34: sendplot.Rnw:1612-1631
###################################################
x.links = as.data.frame(matrix(rep(NA, 3), nrow=1))
x.links[,1] = "http://www.buffalo.edu"
x.links[,2] = "http://www.bioinformatics.buffalo.edu/"
x.links[,3] = "http://sphhp.buffalo.edu/biostat/"
names(x.links) = c("UB", "CoE", "biostats")



Splot = makeImap(Splot, figure=2, xy.type="polygon",
                 x.pos=c(2,2.5,3,2.5), y.pos=c(1,2.5,1,1.5),
                 x.labels = as.data.frame(list(xLabel.xyType = "Polygon")), 
                 asLinks="http://sphhp.buffalo.edu/biostat/",
                 x.links=x.links,fname.root="sendPlotEx", bb.cex=5,
                 y.labels = as.data.frame(list(yLabel1.asLinks="Im a link",
                                          tooltip.fonttype="san-serif",
                                          tooltip.fontsize="30",
                                          tooltip.fontcolor="purple" )), 
                 font.size=30, font.type="sans-serif", font.color="purple", dir=direct)



###################################################
### code chunk number 35: sendplot.Rnw:1707-1709
###################################################
x.lbls=as.data.frame(list(xLabels.xy.type= c("image.box", "image.box"),
                          xLabels.1 = c("X.1", "X.2")))


###################################################
### code chunk number 36: sendplot.Rnw:1719-1720
###################################################
y.lbls=as.data.frame(list(y.Labels = c("Y.1", "Y.2", "Y.3")))


###################################################
### code chunk number 37: sendplot.Rnw:1730-1732
###################################################
xy.lbls=list(XY.label = matrix(c("image.box1","image.box2", "image.box3","image.box4","image.box5","image.box6"),ncol=2), 
XY.label2 = matrix(c("X1.Y1","X1.Y2", "X1.Y3","X2.Y1","X2.Y2","X2.Y3"),ncol=2))


###################################################
### code chunk number 38: sendplot.Rnw:1745-1750
###################################################
x.links=as.data.frame(list(X.links.1 = c("http://www.buffalo.edu", 
                                         NA)))
y.links=as.data.frame(list(Y.links.1 = c(NA,
                         "http://www.buffalo.edu, http://sphhp.buffalo.edu/biostat/index.php",
                         "http://sphhp.buffalo.edu/biostat/index.php")))


###################################################
### code chunk number 39: sendplot.Rnw:1766-1771
###################################################
Splot = makeImap(Splot, figure=3, xy.type="image.box", 
                 x.pos= c(.5,1.5,2.5), y.pos=c(.5,1.5,2.5,3.5),
                 x.labels = x.lbls, y.labels = y.lbls, xy.labels=xy.lbls,
                 x.links=x.links, y.links=y.links, dir=direct,
                 fname.root="sendPlotEx", bb.cex=5, spot.radius=10)


###################################################
### code chunk number 40: sendplot.Rnw:1862-1863
###################################################
Splot = makeSplot(Splot, fname.root="sendPlotEx", dir=direct, returnObj=TRUE)


###################################################
### code chunk number 41: sendplot.Rnw:1923-1935
###################################################
Splot = addDefault(Splot, 
                   data=c("", "quick", "convenient", "highly customizable", 
                         "This is a default region",
                         "arial", "gray", "yellow" ), 
                   data.labels=c("Sendplot selling points", "   1", "   2", "   3", 
                         "type",
                         "tooltip.font", "tooltip.backgroundColor","tooltip.fontColor"),                    

                   links=c("http://www.buffalo.edu", "http://www.bioinformatics.buffalo.edu/"), 
                   links.labels=c("UB", "CoE"),
                   font.size=10, font.type="arial", bg.color="gray", font.color="yellow")



###################################################
### code chunk number 42: sendplot.Rnw:1956-1957
###################################################
Splot = makeSplot(Splot, fname.root="sendPlotEx",dir=direct, returnObj=TRUE, Default=TRUE)


###################################################
### code chunk number 43: sendplot.Rnw:1999-2000
###################################################
Splot = removeImap(Splot, figure="Default", returnVl=TRUE, saveFlag=FALSE)


###################################################
### code chunk number 44: sendplot.Rnw:2011-2012
###################################################
Splot = removeImap(Splot, figure=2, subset=2, returnVl=TRUE, saveFlag=FALSE)


###################################################
### code chunk number 45: sendplot.Rnw:2023-2024
###################################################
Splot = removeImap(Splot, figure=1, subset=NA, returnVl=TRUE, saveFlag=FALSE)


