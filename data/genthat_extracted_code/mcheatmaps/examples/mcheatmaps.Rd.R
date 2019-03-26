library(mcheatmaps)


### Name: mcheatmaps
### Title: Multiple matrices heatmap visualization
### Aliases: mcheatmaps

### ** Examples

library(mcheatmaps)
mpg=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(mpg)=rownames(mtcars)
colnames(mpg)=rownames(mtcars)
hp=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(hp)=rownames(mtcars)
colnames(hp)=rownames(mtcars)
wt=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(wt)=rownames(mtcars)
colnames(wt)=rownames(mtcars)
for(i in 1:nrow(mtcars)){
  for(j in 1:nrow(mtcars)){
    mpg[i,j]=abs(mtcars$mpg[i]-mtcars$mpg[j])
    hp[i,j]=abs(mtcars$hp[i]-mtcars$hp[j])
    wt[i,j]=abs(mtcars$wt[i]-mtcars$wt[j])
  }
}
label=t(mtcars[,colnames(mtcars) == "cyl" | colnames(mtcars) == "gear", drop=FALSE])
aliases=matrix(c("cyl","gear","number of cylinders","number of gears"),2,2)
mcheatmaps(matA=mpg,matB=hp,matC=wt,flabels=label,aliases=aliases,pdfname="CarStats",
legA="Difference in gas consumtion (mpg)",legB="Difference in HorsePower",
legC="Weight Difference (tonne)")



