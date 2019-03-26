library(CDM)


### Name: gdina.dif
### Title: Differential Item Functioning in the GDINA Model
### Aliases: gdina.dif summary.gdina.dif
### Keywords: GDINA model Differential item functioning (DIF) summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DIF for DINA simulated data
##D #############################################################################
##D 
##D # simulate some data
##D set.seed(976)
##D N <- 2000    # number of persons in a group
##D I <- 9       # number of items
##D q.matrix <- matrix( 0, 9,2 )
##D q.matrix[1:3,1] <- 1
##D q.matrix[4:6,2] <- 1
##D q.matrix[7:9,c(1,2)] <- 1
##D # simulate first group
##D guess <- rep( .2, I )
##D slip <- rep(.1, I)
##D dat1 <- CDM::sim.din( N=N, q.matrix=q.matrix, guess=guess, slip=slip,
##D                mean=c(0,0) )$dat
##D # simulate second group with some DIF items (items 1, 7 and 8)
##D guess[ c(1,7)] <- c(.3, .35 )
##D slip[8] <- .25
##D dat2 <- CDM::sim.din( N=N, q.matrix=q.matrix, guess=guess, slip=slip,
##D                mean=c(0.4,.25) )$dat
##D group <- rep(1:2, each=N )
##D dat <- rbind( dat1, dat2 )
##D 
##D #*** estimate multiple group GDINA model
##D mod1 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA", group=group )
##D summary(mod1)
##D 
##D #*** assess differential item functioning
##D dmod1 <- CDM::gdina.dif( mod1)
##D summary(dmod1)
##D   ##     item      X2 df      p p.holm     UA
##D   ##   1 I001 10.1711  2 0.0062 0.0495 0.0428
##D   ##   2 I002  1.9933  2 0.3691 1.0000 0.0276
##D   ##   3 I003  0.0313  2 0.9845 1.0000 0.0040
##D   ##   4 I004  0.0290  2 0.9856 1.0000 0.0044
##D   ##   5 I005  2.3230  2 0.3130 1.0000 0.0142
##D   ##   6 I006  1.8330  2 0.3999 1.0000 0.0159
##D   ##   7 I007 40.6851  2 0.0000 0.0000 0.1184
##D   ##   8 I008  6.7912  2 0.0335 0.2346 0.0710
##D   ##   9 I009  1.1538  2 0.5616 1.0000 0.0180
## End(Not run)




