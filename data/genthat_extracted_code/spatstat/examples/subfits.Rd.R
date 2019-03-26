library(spatstat)


### Name: subfits
### Title: Extract List of Individual Point Process Models
### Aliases: subfits subfits.new subfits.old
### Keywords: spatial models

### ** Examples

  H <- hyperframe(Wat=waterstriders)
  fit <- mppm(Wat~x, data=H)
  subfits(fit)

  H$Wat[[3]] <- rthin(H$Wat[[3]], 0.1)
  fit2 <- mppm(Wat~x, data=H, random=~1|id)
  subfits(fit2)

  ## Don't show: 
a <- subfits.new(fit)
## End(Don't show)



