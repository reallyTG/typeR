library(sptemExp)


### Name: colorGrinf
### Title: Generation of Customed Gradient Colors
### Aliases: colorGrinf
### Keywords: ~kwd1 ~kwd2

### ** Examples


#Example

x=sample(c(1:1000),size=100)
x=x[order(x)]
ret=colorGrinf(x)

## No test: 
# A block Kriging example :

data("spointspre","countylayer")
tarF="d91" # target variable to be kriged
regionName="NAME_3"
bkRes=sptemExp::getTidBKMean(spointspre,countylayer,regionName,tarF,2)

bkRes=bkRes[!is.na(bkRes$bkm_fill),]
levels=c(30,60,100,150,250)
cr=sptemExp::colorGrinf(bkRes$bkm_fill,levels,colors=c("darkgreen","yellow","darkred"))
par(mar=c(1,1,1,1))
title=expression("Regional Block Kriged PM"[2.5]*" Concentration Estimated")
raster::plot(bkRes,col =cr$cols[cr$index],main=title)
legend("bottomright", fill =cr$cols, legend = cr$levels,col =cr$cols, cex=1,bty="n",bg="n")

## End(No test)




