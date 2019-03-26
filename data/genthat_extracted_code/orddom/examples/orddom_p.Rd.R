library(orddom)


### Name: orddom_p
### Title: Ordinal Dominance Matrices and Statistics: Printer-friendly
###   Tab-Delimited Report Output File
### Aliases: orddom_p
### Keywords: nonparametric robust htest

### ** Examples
## Not run: 
##D #Independent Samples (Data taken from Long et al. (2003), Table 4
## End(Not run)
x<-t(matrix(c(3,3,3,4,5,6,12,12,13,14,15,15,15,15,15,16,18,18,18,23,23,27,28,28,43),1))
colnames(x)<-c("Nonalcohol.")
y<-t(matrix(c(1,4,6,7,7,14,14,18,19,20,21,24,25,26,26,26,27,28,28,30,33,33,44,45,50),1))
colnames(y)<-c("Alcoholic")
orddom_p(x,y,,paired=FALSE,outfile="orddom_csv_tab.txt")


