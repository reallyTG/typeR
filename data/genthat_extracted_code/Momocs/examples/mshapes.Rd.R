library(Momocs)


### Name: mshapes
### Title: Mean shape calculation for Coo, Coe, etc.
### Aliases: mshapes mshapes.list mshapes.array mshapes.Ldk mshapes.OutCoe
###   mshapes.OpnCoe mshapes.LdkCoe mshapes.PCA MSHAPES

### ** Examples

#### on shapes
mshapes(wings)
mshapes(wings$coo)
mshapes(coo_sample(bot, 24)$coo)
stack(wings)
coo_draw(mshapes(wings))

bot.f <- efourier(bot, 12)
mshapes(bot.f) # the mean (global) shape
ms <- mshapes(bot.f, 'type')
ms$Coe
class(ms$Coe)
ms <- ms$shp
coo_plot(ms$beer)
coo_draw(ms$whisky, border='forestgreen')
tps_arr(ms$whisky, ms$beer) #etc.

op <- npoly(filter(olea, view=='VL'), 5)
ms <- mshapes(op, 'var') #etc
ms$Coe
panel(Opn(ms$shp), names=TRUE)

wp <- fgProcrustes(wings, tol=1e-4)
ms <- mshapes(wp, 1)
ms$Coe
panel(Ldk(ms$shp), names=TRUE) #etc.
panel(ms$Coe) # equivalent (except the $fac slot)



