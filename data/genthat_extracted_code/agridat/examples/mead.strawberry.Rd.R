library(agridat)


### Name: mead.strawberry
### Title: Strawberry yields in RCB experiment
### Aliases: mead.strawberry

### ** Examples


data(mead.strawberry)
dat <- mead.strawberry
dat$sub <- ifelse(is.element(dat$gen, c('G', 'V', 'R1', 'F')),
              "S1","S2")

if(require(desplot)){
  desplot(yield~col*row, dat,
          text=gen, cex=1, out1=block, out2=sub, # unknown aspect
          main="mead.strawberry")
}




