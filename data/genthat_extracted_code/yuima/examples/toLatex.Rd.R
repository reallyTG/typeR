library(yuima)


### Name: toLatex
### Title: Additional Methods for LaTeX Representations for Yuima objects
### Aliases: toLatex toLatex.yuima toLatex.yuima.model toLatex.yuima.carma
###   toLatex.yuima.cogarch
### Keywords: misc

### ** Examples

# dXt = theta*Xt*dt + dWt
mod1 <- setModel(drift="theta*y", diffusion=1, solve.variable=c("y"))
str(mod1)
toLatex(mod1)

# A multi-dimensional (correlated) diffusion process. 
# To describe the following model: 
# X=(X1,X2,X3); dXt = U(t,Xt)dt + V(t)dWt
# For drift coeffcient
U <- c("-x1","-2*x2","-t*x3")
# For diffusion coefficient of X1 
v1 <- function(t) 0.5*sqrt(t)
# For diffusion coefficient of X2
v2 <- function(t) sqrt(t)
# For diffusion coefficient of X3
v3 <- function(t) 2*sqrt(t)
# correlation
rho <- function(t) sqrt(1/2)
# coefficient matrix for diffusion term
V <- matrix( c( "v1(t)",
                "v2(t) * rho(t)",
                "v3(t) * rho(t)",
                "",
                "v2(t) * sqrt(1-rho(t)^2)",
                "",
                "",
                "",
                "v3(t) * sqrt(1-rho(t)^2)" 
               ), 3, 3)
# Model sde using "setModel" function
cor.mod <- setModel(drift = U, diffusion = V,
state.variable=c("x1","x2","x3"), 
solve.variable=c("x1","x2","x3") )
str(cor.mod)
toLatex(cor.mod)

# A CARMA(p=3,q=1) process.
carma1<-setCarma(p=3,q=1,loc.par="c",scale.par="s")
str(carma1)
toLatex(carma1)

# A COGARCH(p=3,q=5) process.
cogarch1<-setCogarch(p=3,q=5,
                       measure=list(df=list("rNIG(z, mu00, bu00, 1, 0)")),
                       measure.type="code")
str(cogarch1)
toLatex(cogarch1)





