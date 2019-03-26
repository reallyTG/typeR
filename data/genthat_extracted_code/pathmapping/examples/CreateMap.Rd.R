library(pathmapping)


### Name: CreateMap
### Title: Create a mapping between paths
### Aliases: CreateMap

### ** Examples

##################################
## Example from appendix of Mueller, Perelman, & Veinott:

pathA <- rbind(c(0,0),c(5,0),c(10,0))
pathB <- rbind(c(1,1),c(2,-1),c(3,4),c(5,1),c(10,-3))
answer<- CreateMap(pathA,pathB,FALSE)
PlotMap(answer)
answer2 <- GetMinMap(answer)
PlotMap(answer2)


## Not run: 
##D ##################################
##D ##Here is an example of two diagonal paths, a fixed number
##D ##of units apart look at how different equivalent paths produce
##D ## different mappings, but the same area
##D 
##D test2.a <- cbind(1:10*10,1:10*10)
##D test2.b <- cbind(1:10*10+10,1:10*10)
##D 
##D test2.outa <- CreateMap(test2.a,test2.b,FALSE)
##D test2.outb <- CreateMap(test2.b,test2.a,FALSE)
##D test2.outc <- CreateMap((test2.a[10:1,]),(test2.b[10:1,]),FALSE)
##D test2.outd <- CreateMap((test2.b[10:1,]),(test2.a[10:1,]),FALSE)
##D 
##D par(mfrow=c(2,2))
##D PlotMap(test2.outa)
##D PlotMap(test2.outb)
##D PlotMap(test2.outc)
##D PlotMap(test2.outd)
##D 
##D ##################################
##D ##Now, get the 'minimum-distance' mapping among these:
##D 
##D test2.mapa <- GetMinMap(test2.outa)
##D test2.mapb <- GetMinMap(test2.outb)
##D test2.mapc <- GetMinMap(test2.outc)
##D test2.mapd <- GetMinMap(test2.outd)
##D 
##D par(mfrow=c(2,2))
##D PlotMap(test2.mapa)
##D PlotMap(test2.mapb)
##D PlotMap(test2.mapc)
##D PlotMap(test2.mapd)
##D 
##D ##################################
##D ## Example: a loop and itself
##D 
##D test3.a <- rbind(c(102, 100),
##D       c(  120, 109),      c(  133, 124),
##D       c(  146, 138),      c(  158, 155),
##D       c(  174, 166),      c(  194, 170),
##D       c(  213, 173),      c(  233, 176),
##D       c(  251, 169),      c( 260, 151),
##D       c( 255, 132),      c( 245, 115),
##D       c( 235,  98),      c( 223,  82),
##D       c( 212,  65),      c( 194,  58),
##D       c( 175,  65),      c( 166,  82),
##D       c( 169, 101),      c(300,101))
##D 
##D test3.b <- test3.a
##D 
##D test3.out <- CreateMap(test3.a,test3.b)
##D PlotMap(test3.out)
##D 
##D 
##D ########################################
##D ##Example: A loop with an offset version of itself
##D 
##D test4.a <- test3.a
##D test4.b <- test3.a + 20
##D test4.out <- CreateMap(test4.a,test4.b,plotgrid=FALSE)
##D par(mfrow=c(1,2))
##D PlotMap(test4.out)
##D PlotMap(GetMinMap(test4.out)) 
##D 
##D #######################################
##D ## Example:  a gentle curve, and a line.
##D test5.a <- cbind((-10):10*10,exp(-(-10:10*10)^2/500))
##D test5.b <- cbind(-10:10*10,-.5)
##D test5.a2 <- test5.a[21:1,]
##D test5.b2 <- test5.b[21:1,]
##D 
##D 
##D test5.out <- CreateMap(test5.b,test5.a,FALSE)
##D test5.outb <-CreateMap(test5.b2,test5.a2,FALSE)
##D par(mfrow=c(2,2))
##D PlotMap(test5.out) 
##D PlotMap(test5.outb)
##D 
##D PlotMap(GetMinMap(test5.out)) 
##D PlotMap(GetMinMap(test5.outb))
##D 
##D ## Note: the curved path gets 'shadow' opposite points inserted, and so
##D ##the MinMap is a bit off.  In this case, we shouldn't need to insert
##D ##opposites, so we can turn it off:
##D 
##D test5.out <- CreateMap(test5.b,test5.a,plotgrid=FALSE,insertopposites=FALSE)
##D test5.outb <-CreateMap(test5.b2,test5.a2,plotgrid=FALSE,insertopposites=FALSE)
##D par(mfrow=c(2,2))
##D PlotMap(test5.out) 
##D PlotMap(test5.outb)
##D 
##D PlotMap(GetMinMap(test5.out)) 
##D PlotMap(GetMinMap(test5.outb))
##D 
##D 
##D #######################################
##D ##Cut off one part:
##D test5.b2<- test5.b[c(1,5,21),]
##D test5.out2 <- CreateMap(test5.a,test5.b2,FALSE)
##D 
##D PlotMap(test5.out2) 
##D PlotMap(GetMinMap(test5.out2))
##D 
##D 
##D ######################################
##D ## Example: a path with a bump.  Note that
##D ## if we don't allow mapping points onto segments
##D ## the area goes outside the polygon.
##D 
##D test6.a <- rbind(c(0,0),c(1,0),c(10,0))
##D test6.b <- rbind(c(0,1),c(4,1),c(5,9),c(6,1),c(10,1))
##D 
##D ##true area should be 1x10 + 2*8/2 = 18.
##D test6.out <- CreateMap(test6.a,test6.b,FALSE)
##D PlotMap(test6.out) 
##D PlotMap(GetMinMap(test6.out))
##D 
##D 
##D #######################################
##D ## Example: to lines, one with a bump
##D test7.a  <-  rbind(c(1,0),c(2,-1),c(3,0),c(4,0),c(5,0),c(6,0))
##D test7.b <- rbind(c(1,1),c(2,1),c(3,1),c(4,1),c(5,1),c(6,1))
##D 
##D test7.out <- CreateMap(test7.a,test7.b,FALSE)
##D test7.outr <- CreateMap(test7.b,test7.a,FALSE)
##D 
##D test7.outmin <- GetMinMap(test7.out)
##D 
##D par(mfrow=c(3,1),mar=c(3,2,2,0))
##D PlotMap(test7.out)
##D PlotMap(test7.outr)
##D PlotMap(GetMinMap(test7.out))
##D 
##D ########################################
##D ## Example: simplified case with a lot of 'opposites'
##D test8.a <- cbind(0:4+.5,0)
##D test8.b <- cbind(0:4,1)
##D test8.out <- CreateMap(test8.a,test8.b,FALSE)
##D par(mfrow=c(1,2))
##D PlotMap(test8.out)
##D PlotMap(GetMinMap(test8.out))
##D 
##D ########################################
##D ## Example: a crossover
##D 
##D test9.a <- rbind(c(0,0),c(1,0),c(10,0))
##D test9.b <- rbind(c(0,-1),c(4,-1),c(5,9),c(6,-1),c(10,-1))
##D test9.out <- CreateMap(test9.a,test9.b,FALSE)
##D PlotMap(test9.out) 
##D PlotMap(GetMinMap(test9.out))
##D 
##D ########################################
##D ## Example: a variation on previous
##D test10.a <- test9.b
##D test10.b <- rbind(c(0,10),c(20,10))
##D test10.out <- CreateMap(test10.a,test10.b,FALSE)
##D test10.out2 <- CreateMap(test10.b,test10.a,FALSE)
##D 
##D PlotMap(test10.out)
##D PlotMap(test10.out2) 
##D PlotMap(GetMinMap(test10.out))
##D PlotMap(GetMinMap(test10.out2) )
##D 
##D 
##D #######################################
##D ##  Example: Appendix figures
##D pathA <- rbind(c(0,0),c(5,0),c(10,0))
##D pathB <- rbind(c(1,1),c(2,-1),c(3,4),c(5,1),c(10,-3))
##D map1 <- CreateMap(pathA,pathB,FALSE,insertopposites=FALSE)
##D 
##D 
##D ##map2 is broken, or at least the display of map2:
##D map2 <- GetMinMap(map1)
##D 
##D par(mfrow=c(2,1))
##D PlotMap(map1)
##D PlotMap(map2) 
##D 
##D 
##D 
##D ############################################
##D ## Example: another crossover
##D 
##D real.sub <- rbind(c(50,25),c(100,150),c(275,275))
##D mem.sub <- rbind(c(100,30),c(150,250), c(250,200))
##D 
##D xy1 <- real.sub
##D xy2 <- mem.sub
##D 
##D test10.out <- CreateMap(xy1,xy2,FALSE)
##D PlotMap(test10.out)
##D PlotMap(GetMinMap(test10.out))
## End(Not run)



