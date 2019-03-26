library(MixGHD)


### Name: contourpl
### Title: Contour plot
### Aliases: contourpl

### ** Examples

##loading bankruptcy data
data(bankruptcy)

##model estimation
res=MCGHD(data=bankruptcy[,2:3],G=2,method="kmedoids",max.iter=30)
#result
contourpl(res)




