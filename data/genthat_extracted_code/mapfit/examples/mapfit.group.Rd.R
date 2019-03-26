library(mapfit)


### Name: mapfit.group
### Title: MAP fitting with grouped data
### Aliases: mapfit.group

### ** Examples

## load trace data
data(BCpAug89)
BCpAug89s <- head(BCpAug89, 50)

## make grouped data
BCpAug89.group <- hist(cumsum(BCpAug89s),
                       breaks=seq(0, 0.15, 0.005),
                       plot=FALSE)

## MAP fitting for general MAP
(result1 <- mapfit.group(map=map(2),
                         counts=BCpAug89.group$counts,
                         breaks=BCpAug89.group$breaks))

## MAP fitting for MMPP
(result2 <- mapfit.group(map=mmpp(2),
                         counts=BCpAug89.group$counts,
                         breaks=BCpAug89.group$breaks))

## MAP fitting with approximate MMPP
(result3 <- mapfit.group(map=gmmpp(2),
                         counts=BCpAug89.group$counts,
                         breaks=BCpAug89.group$breaks))

## marginal moments for estimated MAP
map.mmoment(k=3, map=result1$model)
map.mmoment(k=3, map=result2$model)
map.mmoment(k=3, map=result3$model)

## joint moments for estimated MAP
map.jmoment(lag=1, map=result1$model)
map.jmoment(lag=1, map=result2$model)
map.jmoment(lag=1, map=result3$model)

## lag-k correlation
map.acf(map=result1$model)
map.acf(map=result2$model)
map.acf(map=result3$model)




