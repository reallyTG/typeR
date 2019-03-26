library(gap)


### Name: chow.test
### Title: Chow's test for heterogeneity in two regressions
### Aliases: chow.test
### Keywords: htest

### ** Examples

## Not run: 
##D dat1 <- matrix(c(
##D 	1.2, 1.9, 0.9,
##D 	1.6, 2.7, 1.3,
##D 	3.5, 3.7, 2.0,
##D 	4.0, 3.1, 1.8,
##D 	5.6, 3.5, 2.2,
##D 	5.7, 7.5, 3.5,
##D 	6.7, 1.2, 1.9,
##D 	7.5, 3.7, 2.7,
##D 	8.5, 0.6, 2.1,
##D 	9.7, 5.1, 3.6), byrow=TRUE, ncol=3)
##D 
##D dat2 <- matrix(c(
##D 	1.4, 1.3, 0.5,
##D 	1.5, 2.3, 1.3,
##D 	3.1, 3.2, 2.5,
##D 	4.4, 3.6, 1.1,
##D 	5.1, 3.1, 2.8,
##D 	5.2, 7.3, 3.3,
##D 	6.5, 1.5, 1.3,
##D 	7.8, 3.2, 2.2,
##D 	8.1, 0.1, 2.8,
##D 	9.5, 5.6, 3.9), byrow=TRUE, ncol=3)
##D 
##D y1<-dat1[,3]
##D y2<-dat2[,3]
##D x1<-dat1[,1:2]
##D x2<-dat2[,1:2]
##D chow.test.r<-chow.test(y1,x1,y2,x2)
## End(Not run)



