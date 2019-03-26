library(agridat)


### Name: fisher.barley
### Title: Multi-environment trial of 5 barley varieties, 6 locations, 2
###   years
### Aliases: fisher.barley
### Keywords: datasets

### ** Examples

data(fisher.barley)
dat <- fisher.barley

if(require(dplyr) & require(lattice)) {
  # Yates 1938 figure 1. Regression on env mean
  # Sum years within loc
  dat2 <- aggregate(yield ~ gen + env, data=dat, FUN=sum)
  # Avg within env
  emn <- aggregate(yield ~ env, data=dat2, FUN=mean)
  dat2$envmn <- emn$yield[match(dat2$env, emn$env)]
  xyplot(yield ~ envmn, dat2, group=gen, type=c('p','r'),
         main="fisher.barley - stability regression",
         xlab="Environment total", ylab="Variety mean",
         auto.key=list(columns=3))
}

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # calculate stability according to the sum-of-squares approach used by
##D   # Shukla (1972), eqn 11. match to Shukla, Table 4, M.S. column
##D   # also matches fernandez, table 3, stabvar column
##D   require(dplyr)
##D   dat2 <- dat
##D   dat2 <- group_by(dat2, gen,env)
##D   dat2 <- summarize(dat2, yield=sum(yield)) # means across years
##D   dat2 <- group_by(dat2, env)
##D   dat2 <- mutate(dat2, envmn=mean(yield)) # env means
##D   dat2 <- group_by(dat2, gen)
##D   dat2 <- mutate(dat2, genmn=mean(yield)) # gen means
##D   dat2 <- ungroup(dat2)
##D   dat2 <- mutate(dat2, grandmn=mean(yield)) # grand mean
##D   # correction factor overall
##D   dat2 <- mutate(dat2, cf = sum((yield - genmn - envmn + grandmn)^2))
##D   t=5; s=6 # t genotypes, s environments
##D   dat2 <- group_by(dat2, gen)
##D   dat2 <- mutate(dat2, ss=sum((yield-genmn-envmn+grandmn)^2))
##D   # divide by 6 to scale down to plot-level
##D   dat2 <- mutate(dat2, sig2i = 1/((s-1)*(t-1)*(t-2)) * (t*(t-1)*ss-cf)/6)
##D   dat2[!duplicated(dat2$gen),c('gen','sig2i')]    
##D   ##       <chr>     <dbl>
##D   ## 1 Manchuria  25.87912
##D   ## 2  Peatland  75.68001
##D   ## 3  Svansota  19.59984
##D   ## 4     Trebi 225.52866
##D   ## 5    Velvet  22.73051
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # mixed model approach gives similar results (but not identical)
##D   # asreml3
##D   library(asreml)
##D   dat2 <- dat2[order(dat2$gen),]
##D 
##D   # G-side
##D   m1g <- asreml(yield ~ gen, data=dat2,
##D                   random = ~ env + at(gen):units,
##D                   family=asreml.gaussian(dispersion=1.0))
##D   m1g <- update(m1g)
##D   summary(m1g)$varcomp[-1,1:2]/6
##D   ##                                          gamma   component
##D   ## at(gen, Manchuria):units!units.var  33.8318944  33.8318944
##D   ## at(gen, Peatland):units!units.var   70.4838297  70.4838297
##D   ## at(gen, Svansota):units!units.var   25.2558315  25.2558315
##D   ## at(gen, Trebi):units!units.var     231.6923935 231.6923935
##D   ## at(gen, Velvet):units!units.var     13.9189381  13.9189381
##D   ## R!variance                           0.1666667   0.1666667
##D 
##D   # R-side estimates = G-side estimate + 0.1666 (resid variance)
##D   m1r <- asreml(yield ~ gen, data=dat2,
##D                  random = ~ env,
##D                  rcov = ~ at(gen):units) # or diag(gen):units
##D   m1r <- update(m1r)
##D   summary(m1r)$varcomp[-1,1:2]/6
##D   ##                            gamma component
##D   ## gen_Manchuria!variance  34.03643  34.03643
##D   ## gen_Peatland!variance   70.72723  70.72723
##D   ## gen_Svansota!variance   25.38494  25.38494
##D   ## gen_Trebi!variance     231.84662 231.84662
##D   ## gen_Velvet!variance     14.05591  14.05591
##D   
## End(Not run)




