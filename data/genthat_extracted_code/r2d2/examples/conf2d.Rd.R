library(r2d2)


### Name: conf2d
### Title: Bivariate (Two-Dimensional) Confidence Region
### Aliases: conf2d conf2d.default conf2d.formula conf2d_int
### Keywords: dplot distribution multivariate smooth

### ** Examples

conf2d(Ushape)$prop
conf2d(saithe, pch=16, cex=1.2, col.points=rgb(0,0,0,0.1), lwd=3)

# First surface, then region
plot(saithe, col="gray")
surf <- MASS::kde2d(saithe$Bio, saithe$HR, h=0.25, n=100)
region <- conf2d_int(saithe$Bio, saithe$HR, surf, level=0.95, n=200)
polygon(region, lwd=2)



