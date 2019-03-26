### R code from vignette source 'spTest-vig.rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: settings
###################################################
options(prompt = "R> ", continue = "+  ", width = 70)


###################################################
### code chunk number 2: libs1
###################################################
library("mvtnorm")
library("fields")


###################################################
### code chunk number 3: isotropicsim
###################################################

matern.2d = function(h, phi, alpha, nu)
{

	a <- (pi*phi)/(2^(nu - 1)*gamma(nu + 1) * alpha^(2*nu))
	d <- h*alpha
	d[d == 0] <- 1e-10
	b <- (d)^nu
	c <- besselK(d, nu)
	
	cov.val <- a*b*c
	return(cov.val)
}

#Function to transform coordinates to create anisotropy
coords.aniso = function (coords, aniso.pars, reverse = FALSE) 
{
    coords <- as.matrix(coords)
    n <- nrow(coords)
    if (length(aniso.pars) != 2) 
        stop("argument aniso.pars must be a vector with 2 elements: the anisotropy angle and anisotropy ratio, respectively")
    psiA <- aniso.pars[1]
    psiR <- aniso.pars[2]
    if (psiR < 1) {
        psiR <- round(psiR, digits = 8)
        if (psiR < 1) 
            stop("anisotropy ratio must be greater than 1")
    }
    rm <- matrix(c(cos(psiA), -sin(psiA), sin(psiA), cos(psiA)), 
        ncol = 2)
    tm <- diag(c(1, 1/psiR))
    if (reverse) 
        coords.mod <- coords %*% solve(rm %*% tm)
    else coords.mod <- coords %*% rm %*% tm
    return(coords.mod)
}


set.seed(2017)

x = seq(0, 12, by = 0.25)
y = seq(0, 12, by = 0.25)

coords = expand.grid(x,y)
n = dim(coords)[1]

aniso.angle <- 3*pi/4
aniso.ratio <- 2
coordsA <- coords.aniso(coords, c(aniso.angle, aniso.ratio))
Da <-  as.matrix(dist(coordsA))

sigma.sq <- 1.0
alpha <- 1/2
sm <- 1
tau.sq <- 0

d <- seq(0, 20, by = 0.1)
phi <- sigma.sq * alpha^(2*sm) * gamma(sm + 1)/ (pi * gamma(sm))
mcov2 <- matern.2d(d, phi, alpha, sm)
er.index <- which( round(mcov2, 2) == 0.05)
er <- d[er.index]
er <- er[1]

D <- as.matrix(dist(coords))
R <- matern.2d(D, phi, alpha, sm)
R <- R + diag(tau.sq, nrow = n, ncol = n)

Ra <- matern.2d(Da, phi, alpha, sm)
Ra <- Ra + diag(tau.sq, nrow = n, ncol = n)

z <- rmvnorm(1,rep(0,n), R, method = c("chol"))
z <- z - mean(z)
zmat <- matrix(z, nrow = length(y), ncol = length(x), byrow = T)
zmat.iso <- zmat

x.shift = -102
y.shift = 37
par(mai = c(0.8, 0.4, 0.8, 0.2), pty = "s")
image(x+x.shift, y+y.shift, zmat,
ylab = "", xlab = "", col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
cex.main = 1.80, pty = "s")
map("state", add = T, lwd = 2)
mtext("Stationary and Isotropic Spatial Process", side = 3, line = 0.5, cex = 1.25, font = 2)
mtext("Longitude", side = 1, line = 2)
mtext("Latitude", side = 2, line = 2)


###################################################
### code chunk number 4: anisotropicsim
###################################################

set.seed(2)
z <- rmvnorm(1,rep(0,n), Ra, method = c("chol"))
z <- z - mean(z)
zmat <- matrix(z, nrow = length(y), ncol = length(x), byrow = T)

zmat.anis <- zmat
zmat.iso <- zmat
x.shift <- -102
y.shift <-  37
par(mai = c(0.8, 0.4, 0.8, 0.2), pty = "s")
image(x+x.shift, y+y.shift, zmat,
ylab = "", xlab = "", col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
cex.main = 1.80, pty = "s")
map("state", add = T, lwd = 2)
mtext("Stationary and Anisotropic Spatial Process", side = 3, line = 0.5, cex = 1.25, font = 2)
mtext("Longitude", side = 1, line = 2)
mtext("Latitude", side = 2, line = 2)


###################################################
### code chunk number 5: libs
###################################################
library("spTest")
library("geoR")
library("splines")
library("MASS")
library("rgdal")
library("mvtnorm")


###################################################
### code chunk number 6: narccap
###################################################
data("WRFG")
coords <- expand.grid(WRFG$xc,WRFG$yc)
sub <- which(coords[,1] > 2.90e6 & coords[,1] < 3.95e6 
& coords[,2] > 1.2e6 & coords[,2] < 2.25e6)
coords.ll <- cbind((WRFG$lon-360)[sub], WRFG$lat[sub])
image.plot(WRFG$lon-360, WRFG$lat, WRFG$WRFG.NCEP.tas, 
col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
legend.lab = "Temp (K)",legend.cex = 0.8,legend.line = 2.2,
xlab = "Longitude", ylab = "Latitude", 
main = "Mean WRFG-NCEP Temperatures")
world(add = T)
left <- seq(1, 400, by = 20)
right <- seq(20, 400, by = 20)
for(i in 2:20){
	segments(coords.ll[i-1,1],coords.ll[i-1,2], coords.ll[i,1],coords.ll[i,2], lwd = 2)
	segments(coords.ll[left[i-1],1],coords.ll[left[i-1],2], coords.ll[left[i],1],coords.ll[left[i],2], lwd = 2)
	segments(coords.ll[right[i-1],1],coords.ll[right[i-1],2], coords.ll[right[i],1],coords.ll[right[i],2], lwd = 2)
	j <- i + 380
	segments(coords.ll[j-1,1],coords.ll[j-1,2], coords.ll[j,1],coords.ll[j,2], lwd = 2)
}


###################################################
### code chunk number 7: heatmap1
###################################################
tas <- c(WRFG$WRFG.NCEP.tas)[sub]
x.coord <- unique(coords[sub,1])
y.coord <- unique(coords[sub,2])
nx <- length(x.coord)
ny <- length(y.coord)
tas.mat <- matrix(tas, nrow = nx, ncol = ny, byrow = F)
image.plot(x.coord, y.coord, tas.mat, 
col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
legend.lab = "Temp (K)",legend.cex = 0.8,legend.line = 2.2,
ylab = "Northing", xlab = "Easting",
main = "Subset of Temperatures")


###################################################
### code chunk number 8: dirsemi1
###################################################
tas.geodat <- as.geodata(cbind(coords[sub,1],coords[sub,2], tas))
plot( variog4(tas.geodat), xlab = "distance (meters)", ylab = "estimated semivariogram")
title("Directional Sample Semivariograms")


###################################################
### code chunk number 9: test1
###################################################
my.delta <- 50000
mylags <-  rbind(c(1,0), c(0, 1), c(1, 1), c(-1,1))
myA <-  rbind(c(1, -1, 0 , 0), c(0, 0, 1, -1))
tr <- GuanTestGrid(spdata = tas.geodat, delta = my.delta, lagmat = mylags, A = myA,
 df = 2, window.dims = c(4,4), pt.est.edge = TRUE, sig.est.edge = TRUE, 
 sig.est.finite = TRUE)
tr$alternative <- NULL
tr$sigma.hat <- NULL
print(tr)


###################################################
### code chunk number 10: model1
###################################################
m1 <- lm(tas ~ ns(coords[sub,1], df = 3) + ns(coords[sub,2], df = 3))
summary(m1)


###################################################
### code chunk number 11: iso2
###################################################
resid.mat <- matrix(studres(m1), nrow = nx, ncol = ny, byrow = F)
image.plot(x.coord, y.coord, resid.mat, 
col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
xlab = "Easting", ylab = "Northing")
title("Heat Map of Studentized Residuals")


###################################################
### code chunk number 12: dsvar2
###################################################
resid.geo <- as.geodata(as.matrix(cbind(coords[sub,1:2], studres(m1))))
plot(variog4(resid.geo), xlab = "distance (meters)", ylab = "estimated semivariogram")
title("Directional Sample Semivariograms")


###################################################
### code chunk number 13: test2
###################################################
tr <- GuanTestGrid(spdata = resid.geo, delta = my.delta, lagmat = mylags, A = myA, df = 2, window.dims = c(4,4))
tr$p.value.finite


###################################################
### code chunk number 14: rain
###################################################
data("COmonthlyMet")
sub30 <- CO.ppt[74:103,,]
nstations <- 376
years <- 1968:1997
nyears <- length(years)
yr.avg <- matrix(data = NA, nrow = nstations, ncol = nyears)
for(i in 1:nyears){
	yr.dat <- sub30[i,,]
	yr.avg[,i] <- apply(yr.dat, 2 , mean, na.rm = T)
}
avg30 <- apply(yr.avg, 1, mean, na.rm = T)
CO.loc <- as.matrix(CO.loc)
CO.loc.utm <- project(CO.loc, 
"+proj=utm +zone=13 ellps=WGS84")/1e+5
quilt.plot(CO.loc.utm, log(avg30), 
col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
legend.lab = "Precip (log mm)",legend.cex = 0.8,legend.line = 2.2,
xlab = "Easting", ylab = "Northing",
main = "Quilt Plot of log(precip)")
mp <- map("state", region = c("colorado", "wyoming","nebraska", "utah", "new mexico", "oklahoma"), plot = F)
st.loc <- cbind(mp$x, mp$y)
states <- project(st.loc, 
"+proj=utm +zone=13 ellps=WGS84")/1e+5
points(states[,1], states[,2], type = "l", lwd = 1.5)


###################################################
### code chunk number 15: elev
###################################################
quilt.plot(CO.loc.utm, CO.elev, 
col = two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60"),
legend.lab = "Elevation (meters)",legend.cex = 0.8,legend.line = 2.7,
xlab = "Easting", ylab = "Northing",
main = "Quilt Plot of Elevation")
points(states[,1], states[,2], type = "l", lwd = 1.5)


###################################################
### code chunk number 16: rain1
###################################################
plot(CO.elev, log(avg30) , xlab = "Elevation (meters)",ylab = "Precip (log mm)",main = "log(Precip) vs. Elevation")
m1 <- lm( log(avg30) ~ ns(CO.elev, df = 3))
summary(m1)
fits <- m1$fitted.values
bad <- is.na(avg30)
x <- CO.elev[which(!bad)]
lines(sort(x), fits[order(x)], lwd = 3, col = "red")


###################################################
### code chunk number 17: rain2
###################################################
qqnorm(studres(m1))
abline(0,1)


###################################################
### code chunk number 18: precipdv
###################################################
precip.resid <- cbind(CO.loc.utm[which(!bad),][,1],CO.loc.utm[which(!bad),][,2] , studres(m1))
precip.geo <- as.geodata(precip.resid) 
plot(variog4(precip.geo), xlab = "distance (100s of km)", ylab = "estimated semivariogram", legend = F)
legend("bottomright", legend = c(expression(0*degree), expression(45*degree), expression(90*degree), expression(135*degree)), col = 1:4, lty = 1:4)
title("Directional Sample Semivariograms")


###################################################
### code chunk number 19: lags
###################################################
mylags <- rbind(c(0.60, 0), c(0, 0.60), c(0.45, 0.45), c(-0.45, 0.45))
myA <- rbind(c(1, -1, 0 , 0), c(0, 0, 1, -1))


###################################################
### code chunk number 20: grid
###################################################
my.color <- two.colors(n = 256, start = "blue3", end = "red3", middle = "gray60")
quilt.plot(precip.resid[,1:2], precip.resid[,3], 
col = my.color,
xlab = "Easting", ylab = "Northing", xlim = c(0.75,8.65), ylim = c(40.1, 46.2) )
title("Quilt Plot of Residuals and Grid Used for Subsampling")
tol <- 0.02
my.xlims <-  c(min(precip.resid[,1]) - tol, max(precip.resid[,1]) + tol )
my.ylims <-  c( min(precip.resid[,2]) - tol, max(precip.resid[,2]) + tol )
xlen <-  my.xlims[2]-my.xlims[1]
ylen <-  my.ylims[2]-my.ylims[1]
my.grid.spacing <-  c(xlen/16, ylen/12)
xgrid <- seq(my.xlims[1], my.xlims[2], by = my.grid.spacing[1])
ygrid <- seq(my.ylims[1], my.ylims[2], by = my.grid.spacing[2])
segments(x0 = xgrid, y0 = min(my.ylims), y1 = max(my.ylims), lty = 2)
segments(x0 = min(my.xlims), y0 = ygrid, x1 = max(my.xlims), lty = 2)


###################################################
### code chunk number 21: nongrid
###################################################
myh <-  0.7
myh.sb <-  0.85
tr.guan <- GuanTestUnif(spdata = precip.resid, lagmat = mylags, A = myA, 
df = 2, h = myh, kernel = "norm", truncation = 1.5, xlims = my.xlims, 
ylims = my.ylims, grid.spacing = my.grid.spacing, window.dims = c(4,3), 
subblock.h = myh.sb)
tr.guan$p.value.finite

set.seed(2016)
tr.maity <- MaityTest(spdata = precip.resid, lagmat = mylags, 
A = myA, df = 2, xlims = my.xlims, ylims = my.ylims,
grid.spacing = my.grid.spacing, block.dims = c(4,3), nBoot = 100)
tr.maity$p.value


