library(leafSTAR)


### Name: simu.star
### Title: Calculate simulated silhouette to area ratios
### Aliases: simu.star
### Keywords: re-calculate star

### ** Examples

## No test: 
# With custom vectors from outside of the dataframe
 data(guava)
  myhours<-seq(8,16,0.25) # Create a vector of hours from 8:00 to 16:00 every 15 minutes.
  mydates<-seq(1,365,60) # Create a vector of days from January 1st to December 31st, 
                         # every 60 days.
  myguava<-simu.star(guava,lat=40.8,long=-4.2,local.time=6,tz=1,
           Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
           horiz=FALSE,course=guava$course,date=30,o.format=NULL,
           c.hour=myhours,c.date=mydates,c.long=NULL,c.lat=NULL, 
           c.tz=NULL, LA=NULL)

 # LA is not NULL
  wrong<-simu.star(guava,lat=40.8,long=-4.2,local.time=6,tz=1,
         Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
         horiz=FALSE,course=guava$course,date=30,o.format=NULL,
         c.hour=c(7,9.5,12),c.date=c(0,180),LA=guava$LA.cm2,details=TRUE)
     # Some custom settings are missing. STAR is retrieved as if LA = NULL, 
     # meaning LA data will not be readily available for calculating SAL. 

  correct<-simu.star(guava,lat=40.8,long=-4.2,local.time=6,tz=1,
           Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
           horiz=FALSE,course=guava$course,date=30,o.format=NULL,
           c.hour=c(7,9.5,12),c.date=c(0,180),c.lat=40.8,c.long=-4.2, 
           c.tz=1, LA=guava$LA.cm2,details=TRUE)
     # Returns LA and STAR

 # LA is NULL
  correct1<-simu.star(guava,lat=40.8,long=-4.2,local.time=6,tz=1,
            Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
            horiz=FALSE,course=guava$course,date=30,o.format=NULL,
            c.hour=c(7,9.5,12),c.date=c(0,180),c.long=NULL,c.lat=NULL, 
            c.tz=NULL, LA=NULL,details=TRUE)
          # Is the same as
  correct2<-simu.star(guava,lat=40.8,long=-4.2,local.time=6,tz=1,
            Ahmes=FALSE,ID=NULL,pitch=guava$pitch,roll=guava$roll,
            horiz=FALSE,course=guava$course,date=30,o.format=NULL,
            c.hour=c(7,9.5,12),c.date=c(0,180),details=TRUE)
## End(No test)
#simu.star() 



