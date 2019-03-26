library(agridat)


### Name: eden.nonnormal
### Title: Height of barley plants in a study of non-normal data
### Aliases: eden.nonnormal
### Keywords: datasets

### ** Examples


data(eden.nonnormal)
dat <- eden.nonnormal
mean(dat$height) # 55.23 matches Eden table 1

# Eden figure 2
if(require(dplyr) & require(lattice)){
  # Blocks had different means, so substract block mean from each datum
  dat <- group_by(dat, block)
  dat <- mutate(dat, blkmn=mean(height))
  dat <- transform(dat, dev=height-blkmn)
  
  histogram( ~ dev, data=dat, breaks=seq(from=-40, to=30, by=2.5),
            xlab="Deviations from block means",
            main="eden.nonnormal - heights skewed left")
}

## Not run: 
##D 
##D   # calculate skewness, permutation 
##D   
##D   library(dplyr)
##D   library(lattice)
##D   library(latticeExtra)
##D   
##D   # Eden table 1
##D   # anova(aov(height ~ factor(block), data=dat))
##D   
##D   # Eden table 2,3. Note, this may be a different definition of skewness
##D   # than is commonly used today (e.g. e1071::skewness).
##D   skew <- function(x){
##D     n <- length(x)
##D     x <- x - mean(x)
##D     s1 = sum(x)
##D     s2 = sum(x^2)
##D     s3 = sum(x^3)
##D     k3=n/((n-1)*(n-2)) * s3 -3/n*s2*s1 + 2/n^2 * s1^3
##D     return(k3)
##D   }
##D   # Negative values indicate data are skewed left
##D   dat <- group_by(dat, block)
##D   summarize(dat, s1=sum(height),s2=sum(height^2), mean2=var(height), k3=skew(height))
##D   ##   block     s1       s2     mean2         k3
##D   ##   <int>  <dbl>    <dbl>     <dbl>      <dbl>
##D   ## 1     1 1682.0  95929.5 242.56048 -1268.5210
##D   ## 2     2 1858.0 111661.5 121.97984 -1751.9919
##D   ## 3     3 1809.5 108966.8 214.36064 -3172.5284
##D   ## 4     4 1912.0 121748.5 242.14516 -2548.2194
##D   ## 5     5 1722.0  99026.5 205.20565  -559.0629
##D   ## 6     6 1339.0  63077.0 227.36190  -801.2740
##D   ## 7     7 1963.0 123052.5  84.99093  -713.2595
##D   ## 8     8 1854.0 112366.0 159.67339 -1061.9919
##D 
##D   # Another way to view skewness with qq plot. Panel 3 most skewed.
##D   qqmath( ~ dev|factor(block), data=dat,
##D          as.table=TRUE,
##D          ylab="Deviations from block means",
##D          panel = function(x, ...) {
##D            panel.qqmathline(x, ...)
##D            panel.qqmath(x, ...)
##D          })
##D 
##D   # Now, permutation test.
##D   # Eden: "By a process of amalgamation the eight sets of 32 observations were
##D   # reduced to eight sets of four and the data treated as a potential
##D   # layout for a 32-plot trial".
##D   dat2 <- transform(dat, grp = rep(1:4, each=8))
##D   dat2 <- aggregate(height ~ grp+block, dat2, sum)
##D   dat2$trt <- rep(letters[1:4], 8)
##D   dat2$block <- factor(dat2$block)
##D 
##D   # Treatments were assigned at random 1000 times
##D   set.seed(54323)
##D   fobs <- rep(NA, 1000)
##D   for(i in 1:1000){
##D     # randomize treatments within each block
##D     # trick from http://stackoverflow.com/questions/25085537
##D     dat2$trt <- with(dat2, ave(trt, block, FUN = sample))
##D     fobs[i] <- anova(aov(height ~ block + trt, dat2))["trt","F value"]
##D   }
##D 
##D   # F distribution with 3,21 deg freedom
##D   # Similar to Eden's figure 4, but on a different horizontal scale
##D   xval <- seq(from=0,to=max(fobs), length=50)
##D   yval <- df(xval, df1 = 3, df2 = 21)
##D   # Re-scale, 10 = max of historgram, 0.7 = max of density
##D   histogram( ~ fobs, breaks=xval,
##D             xlab="F value",
##D             main="Observed (histogram) & theoretical (line) F values") +
##D     xyplot((10/.7)* yval ~ xval, type="l", lwd=2)
##D 
## End(Not run)




