## ------------------------------------------------------------------------
set.seed(919)
u1 = rlnorm(10)
v1 = rlnorm(10)
Y1 = u1%*%t(v1)

## ------------------------------------------------------------------------
u2 = rlnorm(10)
v2 = rlnorm(10)
Y2 = .5+u2%*%t(v2)

## ------------------------------------------------------------------------
Y_nn = rbind(Y1,Y2)
Y = Y_nn + array(rlnorm(prod(dim(Y_nn)),0,.05),dim(Y_nn))

## ---- out.width='100%', fig.asp=.5, dpi=300------------------------------
library('reshape2')
library('ggplot2')
group = factor(rep(c(1,2),each=nrow(Y)/2))
levels(group) = c("group1","group2")
mY = melt(data.frame(Y,group),id.vars="group")
ggplot(data=mY,mapping=aes(x=value,color=group))+geom_histogram(bins=100)+geom_vline(data=aggregate(value~group,data=mY,mean),mapping=aes(xintercept=value,linetype=group),size=1.5)

## ------------------------------------------------------------------------
t.test(rowMeans(Y)[group=="group1"],rowMeans(Y)[group=="group2"])

## ------------------------------------------------------------------------
library('rrscale')
scl = rrscale(Y,run_parallel=FALSE)

## ------------------------------------------------------------------------
scl$T_name

## ------------------------------------------------------------------------
scl$par_hat

## ------------------------------------------------------------------------
trans_Y = scl$RR

## ------------------------------------------------------------------------
trans_Y2 = scl$rr_fn(Y)
all(trans_Y2==trans_Y,na.rm=TRUE)

## ---- out.width='100%', fig.asp=.5, dpi=300------------------------------
tmY = melt(data.frame(trans_Y,group),id.vars="group")
ggplot(data=tmY,mapping=aes(x=value,color=group))+geom_histogram(bins=100)+geom_vline(data=aggregate(value~group,data=tmY,mean),mapping=aes(xintercept=value,linetype=group),size=1.5)

## ------------------------------------------------------------------------
t.test(rowMeans(trans_Y)[group=="group1"],rowMeans(trans_Y)[group=="group2"])

## ---- out.width='100%', dpi=300------------------------------------------
plot(svdc(Y)$u[,1:2],col=group)

## ---- out.width='100%', dpi=300------------------------------------------
plot(svdc(trans_Y)$u[,1:2],col=group)

## ------------------------------------------------------------------------
cancor(model.matrix(~1+group),svdc(Y)$u[,1:2])

## ------------------------------------------------------------------------
cancor(model.matrix(~1+group),svdc(trans_Y)$u[,1:2])

