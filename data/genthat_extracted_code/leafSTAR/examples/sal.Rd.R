library(leafSTAR)


### Name: sal
### Title: Calculate the projected surface area of a tilted plane
### Aliases: sal

### ** Examples

## No test: 
data(guava)
 ## Calculate SAL for a given location, date and time
    gua<-star(guava,lat=40.82,long=-4.21,local.time=12,tz=1,
         Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
         horiz=FALSE,course=guava$course,date=30,o.format=NULL)
         sal(gua,LA=guava$LA.cm2)

 ## Calculate SAL from simu.star() 
    sim.gua<-simu.star(guava,lat=40.82,long=-4.21,local.time=12,tz=1,
             Ahmes=FALSE,ID=NULL, pitch=guava$pitch,roll=guava$roll,
             horiz=FALSE,course=guava$course,date=30,o.format=NULL,
             c.hour=c(7,9.5,12),c.date=30,c.lat=40.8,c.long=-4.2,c.tz=1,
             LA=guava$LA.cm2,details=TRUE)
             sal.guava<-sal(sim.gua$STAR,LA=sim.gua$LA)
## End(No test)
#sal()



