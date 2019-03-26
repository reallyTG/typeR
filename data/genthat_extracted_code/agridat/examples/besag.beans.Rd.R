library(agridat)


### Name: besag.beans
### Title: Competition experiment in beans with height measurements
### Aliases: besag.beans
### Keywords: datasets

### ** Examples


data(besag.beans)
dat = besag.beans

if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          aspect=12/19, out1=row, out2=rep, num=gen, cex=1, # true aspect
          main="besag.beans")
}

if(require(reshape2)){
  # Add a covariate = excess height of neighbors
  mat <- acast(dat, row~col, value.var='height')
  mat2 <- matrix(NA, nrow=4, ncol=38)
  mat2[,2:37] <- (mat[,1:36] + mat[,3:38] - 2*mat[,2:37])
  dat2 <- melt(mat2)
  colnames(dat2) <- c('row','col','cov')
  dat <- merge(dat, dat2)
  
  # Drop border plots
  dat <- subset(dat, rep != 'R0')
  
  require(lattice)
  # Plot yield vs neighbors height advantage
  xyplot(yield~cov, data=dat, group=gen,
         main="besag.beans",
         xlab="Mean excess heights of neighbor plots",
         auto.key=list(columns=3))
  
  # Trial mean.
  mean(dat$yield) # 391 matches Kempton table 3
  
  # Mean excess height of neighbors for each genotype
  tapply(dat$cov, dat$gen, mean)/2 # Matches Kempton table 4

  # Variety means, matches Kempton table 4 mean yield
  m1 <- lm(yield ~ -1 + gen, dat)
  coef(m1)

  # Full model used by Kempton, eqn 5.  Not perfectly clear.
  # Appears to include rep term, perhaps within block
  dat$blk <- factor(dat$row)
  dat$blkrep <- factor(paste(dat$blk, dat$rep))
  m2 <- lm(yield ~ -1 + gen + blkrep + cov, data=dat)
  coef(m2) # slope 'cov' = -.72, while Kempton says -.79
}





