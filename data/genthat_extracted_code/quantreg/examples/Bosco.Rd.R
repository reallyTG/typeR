library(quantreg)


### Name: Bosco
### Title: Boscovich Data
### Aliases: Bosco
### Keywords: datasets

### ** Examples

data(Bosco)
plot(0:10/10,0:10*100,xlab="sin^2(latitude)",
        ylab="arc-length of 1 degree of latitude",type="n")
points(Bosco)
text(Bosco, pos = 3, rownames(Bosco))
z <- rq(y ~ x, tau = -1, data = Bosco)
title("Boscovitch Ellipticity of the Earth Example")
xb <- c(.85,.9,.6,.6)
yb <- c(400,600,450,600)
for(i in 1:4){
        abline(c(z$sol[4:5,i]))
        interval <- paste("t=(",format(round(z$sol[1,i],2)),",",
                format(round(z$sol[1,i+1],2)),")",delim="")
        text(xb[i],yb[i],interval)
        }



