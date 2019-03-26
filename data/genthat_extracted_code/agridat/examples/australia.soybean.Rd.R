library(agridat)


### Name: australia.soybean
### Title: Multi-environment trial of soybean in Australia
### Aliases: australia.soybean

### ** Examples


data(australia.soybean)
dat <- australia.soybean

if(require(reshape2)){
dm <- melt(dat, id.var=c('env', 'year','loc','gen'))

# Joint plot of genotypes & traits. Similar to Figure 1 of Kroonenberg 1989
dmat <- acast(dm, gen~variable, fun=mean)
dmat <- scale(dmat)
biplot(princomp(dmat), main="australia.soybean trait x gen biplot", cex=.75)
}

# Figure 1 of Kozak 2010, lines 44-58
## Not run: 
##D   require(agridat); require(reshape2) ; require(lattice); require(latticeExtra)
##D   data(australia.soybean)
##D   dat <- australia.soybean
##D   dat <- melt(dat, id.var=c('env', 'year','loc','gen'))
##D   dat <- acast(dat, gen~variable, fun=mean)
##D   dat <- scale(dat)
##D   dat <- as.data.frame(dat)[,c(2:6,1)]
##D   dat$gen <- rownames(dat)
##D   # data for the graphic by Kozak
##D   dat2 <- dat[44:58,]
##D   dat3 <- subset(dat2, is.element(gen, c("G48","G49","G50","G51")))
##D   
##D   parallelplot( ~ dat3[,1:6]|dat3$gen, main="australia.soybean",
##D                as.table=TRUE, horiz=FALSE) +
##D     parallelplot( ~ dat2[,1:6], horiz=FALSE, col="gray80") +
##D     parallelplot( ~ dat3[,1:6]|dat3$gen,
##D                  as.table=TRUE, horiz=FALSE, lwd=2)
## End(Not run)




