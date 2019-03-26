library(ade4)


### Name: procella
### Title: Phylogeny and quantitative traits of birds
### Aliases: procella
### Keywords: datasets

### ** Examples

data(procella)
pro.phy <- newick2phylog(procella$tre)
plot(pro.phy,clabel.n = 1, clabel.l = 1)
wt <- procella$traits
wt$site.fid[is.na(wt$site.fid)] <- mean(wt$site.fid[!is.na(wt$site.fid)])
wt$site.fid <- asin(sqrt(wt$site.fid/100))
wt$ALE[is.na(wt$ALE)] <- mean(wt$ALE[!is.na(wt$ALE)])
wt$ALE <- sqrt(wt$ALE)
wt$BF[is.na(wt$BF)] <- mean(wt$BF[!is.na(wt$BF)])
wt$mass <- log(wt$mass)
wt <- wt[, -6]
table.phylog(scalewt(wt), pro.phy, csi = 2)
gearymoran(pro.phy$Amat,wt,9999)



