library(agridat)


### Name: little.splitblock
### Title: Split-block experiment of sugar beets
### Aliases: little.splitblock
### Keywords: datasets

### ** Examples


data(little.splitblock)
dat <- little.splitblock

# Match marginal totals given by Little.
## sum(dat$yield)
## with(dat, tapply(yield,col,sum))
## with(dat, tapply(yield,row,sum))

# Layout shown by Little figure 10.2
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=block, out2=col, col=nitro, cex=1, num=harvest,
          main="little.splitblock")
}

# Convert continuous traits to factors
dat <- transform(dat, R=factor(row), C=factor(block),
                 H=factor(harvest), N=factor(nitro))

if(FALSE){
  library(lattice)
  xyplot(yield ~ nitro|H,dat)
  xyplot(yield ~ harvest|N,dat)
}

# Anova table matches Little, table 10.3
m1 <- aov(yield ~ R + C + N + H + N:H +
            Error(R:C:N + C:H + C:N:H), data=dat)
summary(m1)




