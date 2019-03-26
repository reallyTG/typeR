library(rLakeAnalyzer)


### Name: lake.number
### Title: Calculate Lake Number
### Aliases: lake.number
### Keywords: manip

### ** Examples


	bthA	<-	c(1000,900,864,820,200,10)
	bthD	<-	c(0,2.3,2.5,4.2,5.8,7)
	uStar	<-	c(0.0032,0.0024)
	St	<-	c(140,153)
	metaT	<-	c(1.34,1.54)
	metaB	<-	c(4.32,4.33)
	averageHypoDense	<-	c(999.3,999.32)
	cat('Lake Number for input vector is: ')
	cat(lake.number( bthA, bthD, uStar, St, metaT, metaB, averageHypoDense) )




