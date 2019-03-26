library(QRM)


### Name: CopulaAC
### Title: Archimedean Copulae
### Aliases: dcopula.AC dcopula.clayton dcopula.gumbel rAC rACp
###   rcopula.gumbel rcopula.clayton rcopula.frank rstable rFrankMix
###   rBB9Mix rcopula.Gumbel2Gp rcopula.GumbelNested fit.AC rfrank
### Keywords: distribution

### ** Examples

## Gumbel
r1 <- rAC("gumbel", n = 50, d = 7, theta = 3)
head(r1)
## Weighted Gumbel
alpha <- c(0.95,0.7)
wtmatrix <- cbind(alpha, 1 - alpha)
r2 <- rACp(name = "gumbel", n = 1000, d = 2, theta = c(4, 1),
           A = wtmatrix)
head(r2)
## Gumbel with two-group structure
r3 <- rcopula.Gumbel2Gp(n = 3000, gpsizes = c(3, 4),
                        theta = c(2, 3, 5)) 
pairs(r3)
## Nested Gumbel
r4 <- rcopula.GumbelNested(n=3000,theta=1:6) 
pairs(r4) 
## Frank
r5 <- rcopula.frank(1000, 2, 4) 
pairs(r5)
## Fitting of Gumbel and Clayton
data(smi)
data(ftse100)
s1 <- window(ftse100, "1990-11-09", "2004-03-25")
s1a <- alignDailySeries(s1)
s2a <- alignDailySeries(smi)
idx <- merge(s1a, s2a)
r <-returns(idx)
rp <- series(window(r, "1994-01-01", "2003-12-31"))
rp <- rp[(rp[, 1] != 0) & (rp[, 2] !=0), ]
Udata <- apply(rp, 2, edf, adjust = 1)
mod.gumbel <- fit.AC(Udata, "gumbel")
mod.clayton <- fit.AC(Udata, "clayton")
mod.clayton



