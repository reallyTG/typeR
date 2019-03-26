library(agridat)


### Name: durban.competition
### Title: Sugar beet yields with competition effects
### Aliases: durban.competition

### ** Examples


data(durban.competition)
dat <- durban.competition

# Check that genotypes were balanced across wheel tracks.
with(dat, table(gen,wheel))

if(require(desplot)){
  desplot(yield ~ col*block, dat,
          out1=block, text=gen, col=wheel, aspect=37/19, # true aspect
          main="durban.competition")
}


# Calculate residual after removing block/genotype effects
m1 <- lm(yield ~ gen + block, data=dat)
dat$res <- resid(m1)

## desplot(res ~ col*block, dat, out1=block, text=gen, col=wheel,
##         main="durban.competition - residuals")

# Calculate mean of neighboring plots
dat$comp <- NA
dat$comp[3:36] <- ( dat$yield[2:35] + dat$yield[4:37] ) / 2
dat$comp[41:74] <- ( dat$yield[40:73] + dat$yield[42:75] ) / 2
dat$comp[79:112] <- ( dat$yield[78:111] + dat$yield[80:113] ) / 2

# Demonstrate the competition effect
# Competitor plots have low/high yield -> residuals are negative/positive
require(lattice)
xyplot(res~comp, dat, type=c('p','r'), main="durban.competition",
       xlab="Average yield of neighboring plots", ylab="Residual")




