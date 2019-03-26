library(sparr)


### Name: rimpoly
### Title: Random point generation inside polygon
### Aliases: rimpoly

### ** Examples


data(pbc)
Y <- bivariate.density(pbc,h0=2.5,res=25)

# Direct use of 'rpoint':
A <- rpoint(500,Y$z)
npoints(A)

# Using 'rimpoly' without supplying polygon:
B <- rimpoly(500,Y$z)
npoints(B)

# Using 'rimpoly' with the original pbc polygonal window:
C <- rimpoly(500,Y$z,Window(Y$pp))
npoints(C)

par(mfrow=c(1,3))
plot(A,main="rpoint")
plot(B,main="rimpoly (no polygon supplied)")
plot(C,main="rimpoly (original polygon supplied)")




