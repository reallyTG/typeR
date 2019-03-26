library(agridat)


### Name: beall.webworms
### Title: Counts of webworms in a beet field, with insecticide treatments.
### Aliases: beall.webworms
### Keywords: datasets

### ** Examples


data(beall.webworms)
dat <- beall.webworms

# Match Beall table 1
with(dat, table(y,trt))

require(lattice)
histogram(~y|trt, data=dat, layout=c(1,4), as.table=TRUE,
          main="beall.webworms")

# Visualize Beall table 6.  Block effects may exist, but barely.
if(require(desplot)){
  grays <- colorRampPalette(c("white","#252525"))
  desplot(y ~ col*row, data=dat,
          col.regions=grays(10),
          at=0:10-0.5,
          out1=block, out2=trt, num=trt, flip=TRUE, # aspect unknown
          main="beall.webworms (count of worms)")
}

# Following plot suggests interaction is needed
# with(dat, interaction.plot(spray, lead, y))

# Just a simple model here...
m1 <- glm(y ~ block+spray*lead, data=dat, family="poisson")
summary(m1)
anova(m1)




