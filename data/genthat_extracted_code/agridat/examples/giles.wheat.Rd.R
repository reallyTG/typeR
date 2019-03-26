library(agridat)


### Name: giles.wheat
### Title: Straw length and ear emergence for wheat genotypes.
### Aliases: giles.wheat
### Keywords: datasets

### ** Examples


library(agridat)
data(giles.wheat)
dat <- giles.wheat
dat <- transform(dat, gen=factor(gen))
dat <- transform(dat, env=factor(env))
dat1 <- subset(dat, !is.na(straw))
dat2 <- subset(dat, !is.na(emergence))

# Traits are not related
# with(dat, plot(straw~emergence))

# Show unbalancedness of data
if(require(lattice) & require(reshape2)){
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  levelplot(acast(dat, gen ~ env, value.var='emergence'),
            col.regions=redblue,
            xlab="genotype", ylab="year",
            main="giles.wheat - straw length")
}

## Not run: 
##D 
##D # Analysis of straw length
##D 
##D require(emmeans)
##D require(gnm)
##D 
##D # Mean across years. Matches Piepho Table 7 'Simple'
##D m1 = lm(straw ~ gen, data=dat1)
##D emmeans(m1, 'gen')
##D 
##D # Simple two-way model.  NOT the bi-additive model of Piepho.
##D m2 = lm(straw ~ gen + env, data=dat1)
##D emmeans(m2, 'gen')
##D 
##D # Bi-additive model. Matches Piepho Table 6, rows (c)
##D library(gnm)
##D m3 <- gnm(straw ~ env + Mult(gen,env), data=dat1)
##D cbind(adjusted=round(fitted(m3),0), dat1) 
##D 
##D # Analysis of Ear emergence
##D 
##D require(emmeans)
##D   
##D # Simple two-way model. 
##D m4 = lm(emergence ~ 1 + gen + env, data=dat2)
##D emmeans(m4, c('gen','env')) # Matches Piepho Table 9. rpws (c)
##D emmeans(m4, 'gen') # Match Piepho table 10, Least Squares column
##D 
## End(Not run)




