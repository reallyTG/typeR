library(RandomFields)


### Name: RMbubble
### Title: Bubble model for arbitrary areas of scales
### Aliases: RMbubble
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,1, if (interactive()) 0.02 else 0.5)
d <- sqrt(rowSums(as.matrix(expand.grid(x-0.5, x-0.5))^2))
d <- matrix(d < 0.25, nc=length(x))
image(d)

scale <- RMcovariate(data=as.double(d) * 2 + 0.5, raw=TRUE)

## two models:
## the frist uses the standard approach for determining the
##           reference point z, which is based on gradients
## the second takes the centre of the ball
model1 <- RMbubble(RMexp(), scaling=scale)
model2 <- RMbubble(RMexp(), scaling=scale, z=c(0.5, 0.5))
model3 <- RMbubble(RMexp(), scaling=scale, barycentre=TRUE) # approx. of model2

## model2 has slightly higher correlations than model1:
C1 <- RFcovmatrix(model1, x, x)
C2 <- RFcovmatrix(model2, x, x)
C3 <- RFcovmatrix(model3, x, x) 
print(range(C2 - C1))
dev.new(); hist(C2 - C1)
print(range(C3 - C2)) # only small differences to C2
print(mean(C3 - C2))
dev.new(); hist(C3 - C2)

plot(z1 <- RFsimulate(model1, x, x))
plot(z2 <- RFsimulate(model2, x, x))
plot(z3 <- RFsimulate(model3, x, x)) # only tiny differences to z2


## in the following we compare the standard bubble model with
## the models RMblend, RMscale and RMS (so, model2 above
## performs even better)
biwm <- RMbiwm(nudiag=c(0.5, 0.5), nured=1, rhored=1, cdiag=c(1, 1), 
                s=c(0.5, 2.5, 0.5))
blend <- RMblend(multi=biwm, blend=RMcovariate(data = as.double(d), raw=TRUE))
plot(zblend <- RFsimulate(blend, x, x)) ## takes a while ...
Cblend <- RFcovmatrix(blend, x, x)

Mscale <- RMscale(RMexp(), scaling = scale, penalty=RMid() / 2)
plot(zscale <- RFsimulate(Mscale, x, x))
Cscale <- RFcovmatrix(Mscale, x, x)

Mscale2 <- RMscale(RMexp(), scaling = scale, penalty=RMid() / 20000)
plot(zscale2 <- RFsimulate(Mscale2, x, x))
Cscale2 <- RFcovmatrix(Mscale2, x, x)

S <- RMexp(scale = scale)
plot(zS <- RFsimulate(S, x, x))
CS <- RFcovmatrix(S, x, x)

print(range(C1 - CS))
print(range(C1 - Cscale))
print(range(C1 - Cscale2))
print(range(C1 - Cblend))
dev.new(); hist(C1-CS)     ## C1 is better
dev.new(); hist(C1-Cscale) ## C1 is better
dev.new(); hist(C1-Cscale2) ## both are equally good. Maybe C1 slightly better
dev.new(); hist(C1-Cblend) ## C1 is better




## Don't show: 
FinalizeExample()
## End(Don't show)


