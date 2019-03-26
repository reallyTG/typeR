library(OGI)


### Name: ogi
### Title: Objective General Index
### Aliases: ogi

### ** Examples

CT = matrix(c(
2,1,1,0,0,
8,3,3,0,0,
0,2,1,1,1,
0,0,0,1,1,
0,0,0,0,1), 5, 5, byrow=TRUE)
X = matrix(0, 0, 2)
for(i in 1:5){
  for(j in 1:5){
    if(CT[i,j]>0){
      X = rbind(X, matrix(c(6-i,6-j), CT[i,j], 2, byrow=TRUE))
    }
  }
}
X0 = X
X = as.data.frame(X0)
X[,1] = factor(X0[,1], ordered=TRUE)
X[,2] = factor(X0[,2], ordered=TRUE)
ogiX = ogi(X)
par(pty="s", cex=1.7, mar=c(4.5,3,1,1))
plot(ogiX$scaled, xlim=c(-3,3), ylim=c(-3,3), xlab="Geometry", ylab="Probability")
for(t in 1:nrow(ogiX$scaled)){
  xy = ogiX$scaled[t,]
  g = rep(sum(xy)/2, 2)
  segments(xy[1], xy[2], g[1], g[2], lty=2)
}
arrows(-3, -3, 3, 3)
text(2.5, 2, "OGI/2")
ogiX


f = ordered(1:10)
f[sample(1:10, 20, replace=TRUE)]
Y = ogi(f)$value
plot((1:10)/(10+1), Y, type="b")
xs = (1:1000)/1001
points(xs, qnorm(xs), type="l", col="red")


X = USJudgeRatings
ogiX = ogi(X)
nameX = ordered(names(X), names(X))
plot(nameX, ogiX$weight, las=3, cex.axis=0.8, ylim=c(0,1.2), ylab="weight")



