library(pems.utils)


### Name: 2.3.1.merge.data.pems
### Title: Merging data and pems objects
### Aliases: 2.3.1.merge.data.pems merge.pems align cAlign tAlign
###   findLinearOffset stackPEMS C_ylagxCOR
### Keywords: methods

### ** Examples


###########
##example 1 
###########

##data vector alignment

#make two offset ranges
temp <- rnorm(500)
x <- temp[25:300]
y <- temp[10:200]

#plot pre-alignment data
plot(x, type="l"); lines(y, col="blue", lty=2)

#estimated offset
findLinearOffset(x,y)
#[1] -15

#applying linear offset
ans <- align(x, y, findLinearOffset(x,y))
names(ans) <- c("x", "y")

#plot post-alignment data
plot(ans$x, type="l"); lines(ans$y, col="blue", lty=2)

#shortcut using cAlign
## Not run: 
##D plot(x, type="l"); lines(y, col="blue", lty=2)
##D ans <- cAlign(x~y)
##D plot(ans$x, type="l"); lines(ans$y, col="blue", lty=2)
## End(Not run)


###########
##example 2 
###########

##aligning data sets
##(pems object example)

#make some offset data
p1 <- pems.1[101:200, 1:5]
p2 <- pems.1[103:350, 1:3]

#correlation alignment using ccf 
ans <- cAlign(~conc.co, p1, p2)

#this aligns by comparing p1$conc.co and p2$conc.co
#and aligning at point of best linear regression fit

## Not run: 
##D 
##D #compare:
##D 
##D cAlign(~conc.co, p2, p1)
##D cAlign(conc.co2~conc.co, p1, p2)
##D #(aligns using p1$conc.co2 and p2$conc.co)
##D cAlign(conc.co2~conc.co, p1)
##D #(realigns just conc.co within p1 based on best fit 
##D # with conc.co2 and returns as output ans) 
##D 
##D #time stamp alignment  
##D tAlign(~time.stamp, p1, p2)
##D 
##D #this aligns by pairing elements in p1$time.stamp 
##D #and p2$time.stamp
##D #(if time stamps have different names 
##D # tAlign(time1~time2, p1, p2), the time stamp name 
##D # from p1 would be retained when merging p1$time1 
##D # and p2$time2, generating [output]$time1)  
##D 
## End(Not run)

###########
##example 3 
###########

##stacking pems

#make some offset data
p1 <- pems.1[1:2, 1:4]
p2 <- pems.1[3, 2:4]
p3 <- pems.1[4:6, 1:3]

#stack  
stackPEMS(p1, p2, p3, key=source)




