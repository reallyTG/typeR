library(classInt)


### Name: classIntervals
### Title: Choose univariate class intervals
### Aliases: classIntervals print.classIntervals plot.classIntervals
###   nPartitions classIntervals2shingle
### Keywords: spatial

### ** Examples

data(jenks71, package="spData")
pal1 <- c("wheat1", "red3")
opar <- par(mfrow=c(2,3))
plot(classIntervals(jenks71$jenks71, n=5, style="fixed",
 fixedBreaks=c(15.57, 25, 50, 75, 100, 155.30)), pal=pal1, main="Fixed")
plot(classIntervals(jenks71$jenks71, n=5, style="sd"), pal=pal1, main="Pretty standard deviations")
plot(classIntervals(jenks71$jenks71, n=5, style="equal"), pal=pal1, main="Equal intervals")
plot(classIntervals(jenks71$jenks71, n=5, style="quantile"), pal=pal1, main="Quantile")
set.seed(1)
plot(classIntervals(jenks71$jenks71, n=5, style="kmeans"), pal=pal1, main="K-means")
plot(classIntervals(jenks71$jenks71, n=5, style="hclust", method="complete"),
 pal=pal1, main="Complete cluster")
plot(classIntervals(jenks71$jenks71, n=5, style="hclust", method="single"),
 pal=pal1, main="Single cluster")
set.seed(1)
plot(classIntervals(jenks71$jenks71, n=5, style="bclust", verbose=FALSE),
 pal=pal1, main="Bagged cluster")
plot(classIntervals(jenks71$jenks71, n=5, style="fisher"), pal=pal1, main="Fisher's method")
plot(classIntervals(jenks71$jenks71, n=5, style="jenks"), pal=pal1, main="Jenks' method")
par(opar)
classIntervals(jenks71$jenks71, n=5, style="fixed", fixedBreaks=c(15.57, 25, 50, 75, 100, 155.30))
classIntervals(jenks71$jenks71, n=5, style="sd")
classIntervals(jenks71$jenks71, n=5, style="equal")
classIntervals(jenks71$jenks71, n=5, style="quantile")
set.seed(1)
classIntervals(jenks71$jenks71, n=5, style="kmeans")
set.seed(1)
classIntervals(jenks71$jenks71, n=5, style="kmeans", intervalClosure="right")
set.seed(1)
classIntervals(jenks71$jenks71, n=5, style="kmeans", dataPrecision=0)
set.seed(1)
print(classIntervals(jenks71$jenks71, n=5, style="kmeans"), cutlabels=FALSE)
classIntervals(jenks71$jenks71, n=5, style="hclust", method="complete")
classIntervals(jenks71$jenks71, n=5, style="hclust", method="single")
set.seed(1)
classIntervals(jenks71$jenks71, n=5, style="bclust", verbose=FALSE)
classIntervals(jenks71$jenks71, n=5, style="bclust", hclust.method="complete", verbose=FALSE)
classIntervals(jenks71$jenks71, n=5, style="fisher")
classIntervals(jenks71$jenks71, n=5, style="jenks")
x <- c(0, 0, 0, 1, 2, 50)
classIntervals(x, n=3, style="fisher")
classIntervals(x, n=3, style="jenks")

# Argument 'unique' will collapse the label of classes containing a 
# single value. This is particularly useful for 'censored' variables
# that contain for example many zeros. 

data_censored<-c(rep(0,10), rnorm(100, mean=20,sd=1),rep(26,10))
plot(density(data_censored))

cl2<-classIntervals(data_censored, n=5, style="jenks", dataPrecision=2)

print(cl2, unique=FALSE)
print(cl2, unique=TRUE)



