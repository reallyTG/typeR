library(sensitivity)


### Name: sobolGP
### Title: Kriging-based sensitivity analysis
### Aliases: sobolGP plot.sobolGP ask.sobolGP tell.sobolGP print.sobolGP

### ** Examples


## No test: 
library(DiceKriging)

#--------------------------------------#
# kriging model building
#--------------------------------------#

d <- 2; n <- 16
design.fact <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4))
y <- apply(design.fact, 1, branin) 

m <- km(design=design.fact, response=y)

#--------------------------------------#
# sobol samples & candidate points
#--------------------------------------#

n <- 1000
X1 <- data.frame(matrix(runif(d * n), nrow = n))
X2 <- data.frame(matrix(runif(d * n), nrow = n))

candidate <- data.frame(matrix(runif(d * 100), nrow = 100))

#--------------------------------------#
# Kriging-based Sobol
#--------------------------------------#

res <- sobolGP(
model = m,
type="UK",
MCmethod="sobol",
X1,
X2,
nsim = 100,
conf = 0.95,
nboot=100,
sequential = TRUE,
candidate,
sequential.tot=FALSE,
max_iter = 1000
) 

res
plot(res)
x <- ask(res)
y <- branin(x)
# The following line doesn't work (uncorrected bug: 
#     unused argument in km(), passed by update(), eval(), tell.sobolGP() ??)
#res.new <- tell(res,y,x)
#res.new
## End(No test)



