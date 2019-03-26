library(agridat)


### Name: gomez.splitsplit
### Title: Rice split-split plot experiment
### Aliases: gomez.splitsplit

### ** Examples


data(gomez.splitsplit)
dat <- gomez.splitsplit
dat$nf <- factor(dat$nitro)

if(require(desplot)){
  desplot(nf ~ col*row, dat,
          # aspect unknown
          out1=rep, col=management, num=gen, cex=1,
          main="gomez.splitsplit")
  desplot(yield ~ col*row, dat,
          # aspect unknown
          out1=rep, main="gomez.splitsplit")
}

if(require(HH)){
position(dat$nf) <- c(0,50,80,110,140)
interaction2wt(yield~rep+nf+management+gen, data=dat,
               main="gomez.splitsplit",
               x.between=0, y.between=0,
               relation=list(x="free", y="same"),
               rot=c(90,0), xlab="",
               par.strip.text.input=list(cex=.7))
}

# AOV.  Gomez page 144-153
m0 <- aov(yield~ nf * management * gen + Error(rep/nf/management),
         data=dat)
summary(m0) # Similar to Gomez, p. 153.




