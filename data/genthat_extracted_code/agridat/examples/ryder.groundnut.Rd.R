library(agridat)


### Name: ryder.groundnut
### Title: Wet and dry groundnut yields
### Aliases: ryder.groundnut
### Keywords: datasets

### ** Examples


data(ryder.groundnut)
dat <- ryder.groundnut

# RCB model
m1 <- lm(dry~block+gen,dat)
dat$res1 <- resid(m1)

# Table 3 of Ryder.  Scale up from kg/plot to kg/ha
round(dat$res1 * 596.6,0)

# Visually.  Note largest positive/negative residuals are adjacent
if(require(desplot)){
  desplot(res1 ~ col + row, dat,
          text=gen, # aspect unknown
          main="ryder.groundnut - residuals")
}

## Not run: 
##D   require(desplot)
##D   # Swap the dry yields for two plots and re-analyze
##D   dat[dat$block=="B3" & dat$gen=="A", "dry"] <- 2.8
##D   dat[dat$block=="B3" & dat$gen=="B", "dry"] <- 1.4
##D   m2 <- lm(dry~block+gen, dat)
##D   dat$res2 <- resid(m2)
##D   desplot(res2 ~ col+row, dat,
##D           # aspect unknown
##D           text=gen, main="ryder.groundnut")
## End(Not run)




