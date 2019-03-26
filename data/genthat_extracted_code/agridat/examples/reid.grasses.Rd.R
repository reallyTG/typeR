library(agridat)


### Name: reid.grasses
### Title: Yields of four grasses for a wide range of nitrogen fertilizer
### Aliases: reid.grasses
### Keywords: datasets

### ** Examples

data(reid.grasses)
dat <- reid.grasses

if(require(latticeExtra)){
  foo <- xyplot(drymatter + protein ~ nitro|year, dat, group=gen,
                auto.key=list(columns=4),
                as.table=TRUE, type=c('p','l'),
                main="reid.grasses",ylab="drymatter/protein trait value",
                scales=list(y=list(relation="free")))
  combineLimits(foo)
}

## Not run: 
##D   
##D   library(nlme)
##D   dat2 <- dat
##D   dat2$indiv <- paste(dat$year, dat$gen) # individual year+genotype curves
##D   
##D   # use all data to get initial values
##D   inits <- getInitial(drymatter ~ SSfpl(nitro, A, B, xmid, scal), data = dat2)
##D   inits
##D   ##         A          B       xmid       scal 
##D   ## -4.167902  12.139796  68.764796 128.313106 
##D   xvals <- 0:800
##D   y1 <- with(as.list(inits), SSfpl(xvals, A, B, xmid, scal))
##D   plot(drymatter ~ nitro, dat2)
##D   lines(xvals,y1)
##D   
##D   # must have groupedData object to use augPred
##D   dat2 <- groupedData(drymatter ~ nitro|indiv, data=dat2)
##D   plot(dat2)
##D   
##D   # without 'random', all effects are included in 'random'
##D   m1 <- nlme(drymatter ~ SSfpl(nitro, A, B, xmid,scale),
##D              data= dat2,
##D              fixed= A + B + xmid + scale ~ 1,
##D              # random = B ~ 1|indiv, # to make only B random
##D              random = A + B + xmid + scale ~ 1|indiv,
##D              start=inits)
##D   fixef(m1)
##D   summary(m1)
##D   plot(augPred(m1, level=0:1),
##D        main="reid.grasses - observed/predicted data",) # only works with groupedData object
##D   
## End(Not run)




