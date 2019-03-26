library(rLakeAnalyzer)


### Name: schmidt.stability
### Title: Calculate the Schmidt stability
### Aliases: schmidt.stability
### Keywords: arith

### ** Examples



	bthA	<-	c(1000,900,864,820,200,10)
	bthD	<-	c(0,2.3,2.5,4.2,5.8,7)
	
	wtr	<-	c(28,27,26.4,26,25.4,24,23.3)
	depths	<-	c(0,1,2,3,4,5,6)
	
	cat('Schmidt stability for input is: ')
	cat(schmidt.stability(wtr, depths, bthA, bthD))



