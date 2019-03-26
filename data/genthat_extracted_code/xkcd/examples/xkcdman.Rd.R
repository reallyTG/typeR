library(xkcd)


### Name: xkcdman
### Title: Draw a stick figure
### Aliases: xkcdman
### Keywords: manip

### ** Examples

datascaled <- data.frame(x=c(-3,3),y=c(-30,30))
p <- ggplot(data=datascaled, aes(x=x,y=y)) + geom_point()
xrange <- range(datascaled$x)
yrange <- range(datascaled$y)
ratioxy <- diff(xrange) / diff(yrange)
 
mapping <- aes(x=x,
               y=y,
               scale=scale,
               ratioxy=ratioxy,
               angleofspine = angleofspine,
               anglerighthumerus = anglerighthumerus,
               anglelefthumerus = anglelefthumerus,
               anglerightradius = anglerightradius,
               angleleftradius = angleleftradius,
               anglerightleg =  anglerightleg,
               angleleftleg = angleleftleg,
               angleofneck = angleofneck,
               color = color )
 
dataman <- data.frame( x= c(-1,0,1), y=c(-10,0,10),
                  scale = c(10,7,5),
                  ratioxy = ratioxy,
                  angleofspine =  seq(- pi / 2, -pi/2 + pi/8, l=3) ,
                  anglerighthumerus = -pi/6,
                  anglelefthumerus = pi + pi/6,
                  anglerightradius = 0,
                  angleleftradius = runif(3,- pi/4, pi/4),
                  angleleftleg = 3*pi/2  + pi / 12 ,
                  anglerightleg = 3*pi/2  - pi / 12,
                  angleofneck = runif(3, min = 3 * pi / 2 - pi/10 , max = 3 * pi / 2 + pi/10),
                  color=c("A","B","C"))
 
p + xkcdman(mapping,dataman)



