library(extracat)


### Name: getbw
### Title: Active binning
### Aliases: getbw

### ** Examples


require(scales)

hist(x <- rexp(200,1/10),breaks=gb<-getbw(x,24,min_n = 5, warn=TRUE),
		col = alpha(attr(gb,"outlier")+1,0.3))

hist(x <- rexp(2000,1/10),breaks=gb<-getbw(x,24,min_n = 5,warn=TRUE),
		col = alpha(attr(gb,"outlier")+1,0.3))



x <- rlnorm(1000,log(10),log(4))
x <- c(x, rnorm(500,400,30))

hist(x ,breaks=gb<-getbw(x,24,min_n = 5,warn=TRUE), 
	col = alpha(attr(gb,"outlier")+1,0.3))



x <- rlnorm(1000,log(10),log(4))
x <- c(x, rnorm(500,800,30))

hist(x ,breaks=gb<-getbw(x,24,min_n = 5,warn=TRUE), 
	col = alpha(attr(gb,"outlier")+1,0.3))

## Not run: 
##D 
##D bws1 <-replicate(1000,{
##D 	x <- rexp(200,1/10)
##D 	gb <- getbw(x,20)
##D 	attr(gb,"bw")
##D 	
##D })
##D hist(bws1,breaks=getbw(bws1,30))
##D 
##D 
##D 
##D bws2 <-replicate(1000,{
##D 	x <- rnorm(200)
##D 	x <- x/rnorm(200)
##D 	gb <- getbw(x,20)
##D 	attr(gb,"bw")
##D 	
##D })
##D hist(bws2,breaks=getbw(bws2,30))
##D 
##D 
##D mov <- read.table("http://www.rosuda.org/lehre/WS1213-f/MovieLens.txt",
##D 	header=T, sep="\t")
##D 
##D require(extracat)
##D with(mov,plot(MovieVotes,meanMovieRat,
##D 		pch=19,col=alpha("black",0.2)))
##D with(mov, fluctile(table(cutbw(MovieVotes,30),
##D 		cutbw(meanMovieRat,30))))
##D 
##D 
##D 
##D with(USR, fluctile(table(occupation,cutbw(meanUserRat,30)),
##D 	dir="h",just="b"))
##D 
##D with(USR, fluctile(log(1+table(cutbw(Pct.Animation,50),
##D 	cutbw(Pct.Children.s,50)))))
##D 
##D with(USR, barplot(table(cutbw(Pct.Animation,50,min_n=5))))
##D 
## End(Not run)






