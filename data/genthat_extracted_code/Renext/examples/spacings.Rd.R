library(Renext)


### Name: spacings
### Title: Methods computing spacings between Largest Order Statistics
### Aliases: spacings spacings.numeric spacings.data.frame spacings.Rendata

### ** Examples

sp <- spacings(rgumbel(200, loc = 0, scale = 1))
expplot(sp)
sp1 <- spacings(rgev(200, loc = 0, scale = 1, shape = 0.3))
expplot(sp1)
## spacings are computed by block
sp2 <- spacings(object = Garonne$MAXdata,
                varName = Garonne$info$varName)
expplot(unlist(sp2))
sp3 <- spacings(object = Garonne, type = "OT")
expplot(sp3)



