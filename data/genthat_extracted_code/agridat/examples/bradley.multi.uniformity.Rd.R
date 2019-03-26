library(agridat)


### Name: bradley.multi.uniformity
### Title: Uniformity trial of 4 crops on the same land
### Aliases: bradley.multi.uniformity
### Keywords: datasets

### ** Examples


data(bradley.multi.uniformity)

# figures similar to Bradley, pages 11-15
dat1 <- subset(bradley.multi.uniformity, season==1)
if(require(desplot)){
  desplot(yield ~ col*row, dat1,
          flip=TRUE, aspect=433/366, # true aspect (omits roadways)
          main="bradley.multi.uniformity - season 1, woolly pyrol")
}

dat2 <- subset(bradley.multi.uniformity, season==2)
if(require(desplot)){
  desplot(yield ~ col*row, dat2,
          flip=TRUE, aspect=433/366, # true aspect (omits roadways)
          main="bradley.multi.uniformity - season 2, woolly pyrol")
}

dat3 <- subset(bradley.multi.uniformity, season==3)
if(require(desplot)){
  desplot(yield ~ col*row, dat3,
          flip=TRUE, aspect=433/366, # true aspect (omits roadways)
          main="bradley.multi.uniformity - season 3, maize")
}

dat4 <- subset(bradley.multi.uniformity, season==4)
if(require(desplot)){
  desplot(yield ~ col*row, dat4,
          flip=TRUE, aspect=433/366, # true aspect (omits roadways)
          main="bradley.multi.uniformity - season 4, yams")
}

## Not run: 
##D   # to combine plots across seasons, each yield value was converted to percent
##D   # of maximum yield in that season. Same as Bradley, page 17.
##D   dat1$percent <- dat1$yield / max(dat1$yield) * 100
##D   dat2$percent <- dat2$yield / max(dat2$yield) * 100
##D   dat3$percent <- dat3$yield / max(dat3$yield) * 100
##D   dat4$percent <- dat4$yield / max(dat4$yield) * 100
##D   # make sure data is in same order, then combine
##D   dat1 <- dat1[order(dat1$col, dat1$row),]
##D   dat2 <- dat2[order(dat2$col, dat2$row),]
##D   dat3 <- dat3[order(dat3$col, dat3$row),]
##D   dat4 <- dat4[order(dat4$col, dat4$row),]
##D   dat14 <- dat1[,c('row','col')]
##D   dat14$fertility <- dat1$percent + dat2$percent + dat3$percent + dat4$percent
##D   if(require(desplot)){
##D     desplot(fertility ~ col*row, dat14,
##D             tick=TRUE, flip=TRUE, aspect=433/366, # true aspect (omits roadways)
##D             main="bradley.multi.uniformity - fertility")
##D   }
##D 
## End(Not run)




