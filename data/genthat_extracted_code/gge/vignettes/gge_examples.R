## ----setup, message=FALSE---------------------------------------------------------------
library("knitr")
knitr::opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ----gge--------------------------------------------------------------------------------
library(agridat)
data(yan.winterwheat)
dat1 <- yan.winterwheat

library(gge)
m1 <- gge(yield~gen*env, dat1, scale=FALSE)
biplot(m1, main="yan.winterwheat - GGE biplot",
       flip=c(1,0), origin=0, hull=TRUE)

## ---------------------------------------------------------------------------------------
m2 <- gge(yield~gen*env, dat1, scale=TRUE)
biplot(m2, main="yan.winterwheat - GGE biplot",
       flip=c(1,1), origin=0)

## ---------------------------------------------------------------------------------------
biplot(m2, main="yan.winterwheat - GGE biplot - PC 2 & 3",
       comps=c(2,3), flip=c(1,1), origin=0)

## ----mosaic-----------------------------------------------------------------------------
plot(m1, title="yan.winterwheat")

## ----ggb--------------------------------------------------------------------------------
library(agridat)
data(crossa.wheat)
dat2 <- crossa.wheat

# Define mega-environment groups of locations
dat2$eg <- ifelse(is.element(dat2$loc,
                             c("KN","NB","PA","BJ","IL","TC",
                               "JM","PI","AS","ID","SC","SS",
                               "SJ","MS","MG","MM")), "Grp1", "Grp2")

library(gge)
# Specify env.group as column in data frame
m3 <- gge(yield~gen*loc, dat2, env.group=eg, scale=FALSE)
biplot(m3, title="crossa.wheat - GGB biplot")


## ---- eval=0----------------------------------------------------------------------------
u <- Xc.svd$u
s <- diag(Xc.svd$d)
v <- Xc.svd$v
(u %*% s)[,1:2]
t[,1:2]

## ---- eval=0----------------------------------------------------------------------------
v[,1:2]
p[,1:2]

## ---- eval=0----------------------------------------------------------------------------
u[,1:2]
sv <- sqrt(Xc.pca$eig)
(t %*% diag(1/sv))[,1:2]

## ---- eval=0----------------------------------------------------------------------------
(v %*% s)[,1:2]
(p %*% diag(sv))[,1:2]

## ----session----------------------------------------------------------------------------
sessionInfo()

