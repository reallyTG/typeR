library(WeibullR)


### Name: wblr
### Title: Create a 'wblr' Object for Life Data Analysis
### Aliases: wblr

### ** Examples

## These code lines all generate the same object ##
wblr(c(500,1200,900,1300,510))
wblr(time=c(500,1200,900,1300,510))
## this input format works, but not recommended.
wblr(time=c(500,1200,900,1300,510),event=c(1,1,1,1,1))
wblr(fail=c(500,1200,900,1300,510))
wblr(fail=c(500,1200,900,1300,510),susp=c())
da1 <- data.frame(
    serial=c("S12","S16","S17","S3","S5"),
    time=c(500,1200,900,1300,510),
    event=c(1,1,1,1,1))
## it is best practice set named objects
obj1 <- wblr(da1,label="complete dataset",pch=3,col="orange3")
obj2 <- wblr(da1,label="complete dataset",pch=4,pp="benard",col="red")


## Generate a similar dataset, but with suspensions ##
wblr(time=c(500,1200,900,1300,510),event=c(1,1,1,0,0))
wblr(data.frame(time=c(500,1200,900,1300,510),event=c(1,1,1,0,0)))
wblr(fail=c(500,1200,900),susp=c(1300,510))
wblr(time=c(500,1200,900),susp=c(1300,510))
da3 <- wblr(fail=c(500,1200,900,1300,510),
    event=c(1,1,1,0,0),label="censored dataset",pch=1,col="blue")

## plot datasets ##
## Not run: 
##D plot.wblr(list(da1,da3))
## End(Not run)




