library(orddom)


### Name: orddom
### Title: Ordinal Dominance Statistics
### Aliases: orddom
### Keywords: nonparametric robust htest

### ** Examples
## Not run: 
##D #Independent Samples (Data taken from Long et al. (2003), Table 3
## End(Not run)
x<-t(matrix(c(3,3,3,4,5,6,12,12,13,14,15,15,15,15,15,16,18,18,18,23,23,27,28,28,43),1))
colnames(x)<-c("Nonalcohol.")
y<-t(matrix(c(1,4,6,7,7,14,14,18,19,20,21,24,25,26,26,26,27,28,28,30,33,33,44,45,50),1))
colnames(y)<-c("Alcoholic")
orddom(x,y,paired=FALSE,outputfile="tmp_r.txt")
## Not run: 
##D #Paired Comparison with data written to file (Data taken from Long et al. (2003), Table 4
## End(Not run)
x<-t(matrix(c(2,6,6,7,7,8,8,9,9,9,10,10,10,11,11,12,13,14,15,16),1))
colnames(x)<-c("Incidental")
y<-t(matrix(c(4,11,8,9,10,11,11,5,14,12,13,10,14,16,14,13,15,15,16,10),1))
colnames(y)<-c("Intentional")
orddom_f(y,x,paired=TRUE,symmetric=FALSE)
## Not run: 
##D #Directly returns d_b of the paired comparison
## End(Not run)
orddom(x,y,,TRUE,,,)[11,2]


