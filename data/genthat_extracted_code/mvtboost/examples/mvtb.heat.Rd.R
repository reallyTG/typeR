library(mvtboost)


### Name: mvtb.heat
### Title: Clustered heatmap of tables from 'mvtb'
### Aliases: mvtb.heat

### ** Examples

data(wellbeing)
Y <- wellbeing[,21:26]
X <- wellbeing[,1:20]
Ys <- scale(Y)
cont.id <- unlist(lapply(X,is.numeric))
Xs <- scale(X[,cont.id])

res <- mvtb(Y=Ys,X=Xs)

covex <- mvtb.covex(res, Y=Ys, X=Xs)
par(mar=c(4,7,1,1))
mvtb.heat(covex,cexRow=.8)

col <- colorRampPaletteAlpha(RColorBrewer::brewer.pal(9,"Greys"),100)
mvtb.heat(covex, Y=Ys, X=Xs, col=col, cexRow=.8)

par(mar=c(5,5,1,1))
mvtb.heat(t(mvtb.ri(res)),cexRow=.8,cexCol=1,dec=0)



