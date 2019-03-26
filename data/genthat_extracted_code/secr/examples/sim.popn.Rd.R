library(secr)


### Name: sim.popn
### Title: Simulate 2-D Population
### Aliases: sim.popn tile
### Keywords: datagen

### ** Examples


temppop <- sim.popn (D = 10, expand.grid(x = c(0,100), y =
    c(0,100)), buffer = 50)

## plot, distinguishing "M" and "F"
plot(temppop, pch = 1, cex= 1.5,
    col = c("green","red")[covariates(temppop)$sex])

## add a continuous covariate
## assumes covariates(temppop) is non-null
covariates(temppop)$size <- rnorm (nrow(temppop), mean = 15, sd = 3)
summary(covariates(temppop))

## Neyman-Scott cluster distribution
par(xpd = TRUE, mfrow=c(2,3))
for (h in c(5,15))
for (m in c(1,4,16)) {
    temppop <- sim.popn (D = 10, expand.grid(x = c(0,100),
        y = c(0,100)), model2D = "cluster", buffer = 100,
        details = list(mu = m, hsigma = h))
    plot(temppop)
    text (50,230,paste(" mu =",m, "hsigma =",h))
}
par(xpd = FALSE, mfrow=c(1,1))   ## defaults

## Inhomogeneous Poisson distribution
xy <- secrdemo.0$mask$x + secrdemo.0$mask$y - 900
tempD <- xy^2 / 1000
plot(sim.popn(tempD, secrdemo.0$mask, model2D = "IHP"))

## Coastal distribution in 1000-m square, homogeneous in
## x-direction
arena <- data.frame(x = c(0, 1000, 1000, 0),
    y = c(0, 0, 1000, 1000))
plot(sim.popn(D = 5, core = arena, buffer = 0, model2D =
    "coastal", details = list(Beta = c(1, 1, 5, 1))))

## Hills
plot(sim.popn(D = 100, core = arena, model2D = "hills",
    buffer = 0, details = list(hills = c(-2,3,0,0))), 
    cex = 0.4)

## tile demonstration
pop <- sim.popn(D = 100, core = make.grid(), model2D = "coastal")
par(mfrow = c(1,2), mar = c(2,2,2,2))
plot(tile(pop, "copy"))
polygon(cbind(-100,200,200,-100), c(-100,-100,200,200),
    col = "red", density = 0)
title("copy")
plot(tile(pop, "reflect"))
polygon(cbind(-100,200,200,-100), c(-100,-100,200,200),
    col = "red", density = 0)
title("reflect")


## Not run: 
##D ## simulate from inhomogeneous fitted density model
##D 
##D regionmask <- make.mask(traps(possumCH), type = "polygon",
##D     spacing = 20, poly = possumremovalarea)
##D dts <- distancetotrap(regionmask, possumarea)
##D covariates(regionmask) <- data.frame(d.to.shore = dts)
##D dsurf <- predictDsurface(possum.model.Ds, regionmask)
##D possD <- covariates(dsurf)$D.0
##D posspop <- sim.popn(D = possD, core = dsurf, model = "IHP")
##D plot(regionmask, dots = FALSE, ppoly = FALSE)
##D plot(posspop, add = TRUE, frame = FALSE)
##D plot(traps(possumCH), add = TRUE)
## End(Not run)




