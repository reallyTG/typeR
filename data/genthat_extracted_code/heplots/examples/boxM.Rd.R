library(heplots)


### Name: boxM
### Title: Box's M-test
### Aliases: boxM boxM.formula boxM.lm boxM.default summary.boxM

### ** Examples

data(iris)

# default method
res <- boxM(iris[, 1:4], iris[, "Species"])
res

summary(res)

# visualize (what is done in the plot method) 
dets <- res$logDet
ng <- length(res$logDet)-1
dotchart(dets, xlab = "log determinant")
points(dets , 1:4,  
	cex=c(rep(1.5, ng), 2.5), 
	pch=c(rep(16, ng), 15),
	col= c(rep("blue", ng), "red"))

# formula method
boxM( cbind(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) ~ Species, data=iris)

### Skulls dat
data(Skulls)
# lm method
skulls.mod <- lm(cbind(mb, bh, bl, nh) ~ epoch, data=Skulls)
boxM(skulls.mod)






