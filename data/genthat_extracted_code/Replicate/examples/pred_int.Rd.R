library(Replicate)


### Name: pred_int
### Title: Compute prediction interval for replication study given original
### Aliases: pred_int

### ** Examples

# calculate prediction interval for a single replication study
pred_int( orig.y = 1, orig.vy = .5, rep.y = 0.6,
rep.vy = .2 )

# calculate prediction intervals for a one-to-one design
pred_int( orig.y = c(1, 1.3), orig.vy = c(.01, .6),
rep.y = c(.6, .7), rep.vy = c(.01,.3) )

# calculate prediction intervals for a many-to-one design
pred_int( orig.y = c(1), orig.vy = c(.01), rep.y = c(.6, .7), rep.vy = c(.01,.3) )



