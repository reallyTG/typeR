library(agridat)


### Name: gomez.rice.uniformity
### Title: Uniformity trial of rice
### Aliases: gomez.rice.uniformity

### ** Examples


data(gomez.rice.uniformity)
dat <- gomez.rice.uniformity

if(require(desplot)){
  # Raw data plot
  desplot(yield ~ col*row, data=dat,
          aspect=38/18, # true aspect
          main="gomez.rice.uniformity")
}

if(require(desplot) & require(reshape2)){
  # 3x3 moving average.  Gomez figure 12.1
  dmat <- melt(dat, id.var=c('col','row'))
  dmat <- acast(dmat, row~col)
  m0 <- dmat
  cx <- 2:17
  rx <- 2:35
  dmat3 <- (m0[rx+1,cx+1]+m0[rx+1,cx]+m0[rx+1,cx-1]+
              m0[rx,cx+1]+m0[rx,cx]+m0[rx,cx-1]+
              m0[rx-1,cx+1]+m0[rx-1,cx]+m0[rx-1,cx-1])/9
  dat3 <- melt(dmat3)
  desplot(value~Var2*Var1, dat3,
          aspect=38/18,
          at=c(576,637,695,753,811,870,927),
          main="gomez.rice.uniformity smoothed")
}

if(require(agricolae)){
    # Gomez table 12.4
  tab <- index.smith(dmat,
                     main="gomez.rice.uniformity",
                     col="red")$uniformity
  tab <- data.frame(tab)
  
  ## # Gomez figure 12.2
  ## op <- par(mar=c(5,4,4,4)+.1)
  ## m1 <- nls(Vx ~ 9041/Size^b, data=tab, start=list(b=1))
  ## plot(Vx ~ Size, tab, xlab="Plot size, m^2")
  ## lines(fitted(m1) ~ tab$Size, col='red')
  ## axis(4, at=tab$Vx, labels=tab$CV)
  ## mtext("CV", 4, line=2)
  ## par(op)
}




