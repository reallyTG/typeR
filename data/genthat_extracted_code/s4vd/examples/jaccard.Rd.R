library(s4vd)


### Name: jaccardmat
### Title: jaccard matrix
### Aliases: jaccardmat

### ** Examples

## No test: 
#lung cancer data set   Bhattacharjee et al. 2001
data(lung200)
set.seed(12)
res1 <- biclust(lung200,method=BCs4vd(),pcerv=.5,pceru=0.01,ss.thr=c(0.6,0.65)
,start.iter=3,size=0.632,cols.nc=TRUE,steps=100,pointwise=TRUE
,merr=0.0001,iter=100,nbiclust=10,col.overlap=FALSE)
res2 <- biclust(lung200,method=BCPlaid())
jaccardmat(res1,res2)
## End(No test)



