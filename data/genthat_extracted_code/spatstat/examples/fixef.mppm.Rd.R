library(spatstat)


### Name: fixef.mppm
### Title: Extract Fixed Effects from Point Process Model
### Aliases: fixef.mppm
### Keywords: spatial methods models

### ** Examples

 H <- hyperframe(Y = waterstriders)
 # Tweak data to exaggerate differences
 H$Y[[1]] <- rthin(H$Y[[1]], 0.3)
 m1 <- mppm(Y ~ id,  data=H, Strauss(7))
 fixef(m1)
 m2 <- mppm(Y ~ 1,  random=~1|id, data=H, Strauss(7))
 fixef(m2)



