library(mapfit)


### Name: mapfit-package
### Title: PH/MAP parameter estimation tool
### Aliases: mapfit-package mapfit phfit
### Keywords: package

### ** Examples


### PH fitting with grouped data
## make sample
wgroup <- hist(x=rweibull(n=100, shape=2, scale=1),
	           breaks="fd", plot=FALSE)

## PH fitting for CF1
phfit.group(ph=cf1(2), counts=wgroup$counts,
            breaks=wgroup$breaks)

## PH fitting for hyper Erlang
phfit.group(ph=herlang(3), counts=wgroup$counts,
            breaks=wgroup$breaks)

### MAP fitting with point data
data(BCpAug89)
BCpAug89s <- head(BCpAug89, 50)

## MAP fitting for ER-HMM (fast estimation algorithm)
mapfit.point(map=erhmm(3), x=cumsum(BCpAug89s))


### MAP fitting with grouped data
## make grouped data
BCpAug89.group <- hist(cumsum(BCpAug89s),
                       breaks=seq(0, 0.15, 0.005),
                       plot=FALSE)

## MAP fitting with approximate MMPP
mapfit.group(map=gmmpp(2),
             counts=BCpAug89.group$counts,
             breaks=BCpAug89.group$breaks)




