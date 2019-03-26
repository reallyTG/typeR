## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(echo = TRUE, comment = "##  ", collapse = TRUE, fig.align = "center")
library(popdemo)
options(digits = 4)

## ----eval = FALSE--------------------------------------------------------
#  # Install dependencies from CRAN:
#  install.packages(c("devtools", "expm", "MCMCpack", "markovchain"))
#  
#  # Install stable version from GitHub (recommended):
#  # NOTE don't forget to change the version number!
#  devtools::install_github("iainmstott/popdemo/x.x-x/popdemo") #x.x-x is the desired version number
#  
#  # Install development version 'popdemoDev' (not recommended):
#  devtools::install_github("iainmstott/popdemo/Dev/popdemoDev", ref = "development")
#  

## ----eval = FALSE--------------------------------------------------------
#  install.packages("popdemo")

## ----example, echo = -1--------------------------------------------------
an_input <- function() cat("an output")
# a comment
an_input()

## ------------------------------------------------------------------------
data(Tort); Tort


## ----echo = FALSE--------------------------------------------------------
Tortpic <- magick::image_read("https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Baby_Desert_Tortoise_%2816490346262%29.jpg/1024px-Baby_Desert_Tortoise_%2816490346262%29.jpg")
par(mar = c(0, 0, 0, 0))
plot(as.raster(Tortpic))
text(10, 10, adj = c (0, 0), col = "white",
     "A baby desert tortoise")

## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1)
Tortvec1 <- runif(8)
Tortvec1 <- Tortvec1/sum(Tortvec1) #scales the vector to sum to 1
( Tortp1.1 <- project(Tort, Tortvec1, time = 100) )

plot(Tortp1.1, log = "y")

## ------------------------------------------------------------------------
vec(Tortp1.1)[1:11, ]


## ------------------------------------------------------------------------
vec(Tortp1.1)[ , 2]


## ------------------------------------------------------------------------
eigs(Tort, "all")


## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1); plot(Tortp1.1, log = "y")
Tortw <- eigs(Tort, "ss")
Tortpw <- project(Tort, Tortw, time = 100)
lines(0:100, Tortpw, lty = 2)

## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1)
Tortp1.1s <- project(Tort, Tortvec1, time = 100, 
                     standard.A = TRUE, standard.vec = TRUE)
Tortpws <- project(Tort, Tortw, time = 100, 
                   standard.A = TRUE, standard.vec = TRUE)
plot(Tortp1.1s, log = "y")
lines(Tortpws, lty = 2)

## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1); plot(Tortp1.1s, log = "y"); lines(Tortpws, lty = 2)
( r1 <- reac(Tort, Tortvec1) )

( i1 <- inertia(Tort, Tortvec1) )

points(c(1, 100), c(r1, i1), pch = 3, col = "red")

## ----echo = -1-----------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1)
TortAMP <- c(1, 1, 2, 3, 5, 8, 13, 21) #a population that amplifies
TortATT <- c(21, 13, 8, 5, 3, 2, 1, 1) #a population that attenuates
TortBTH <- c(0, 0, 0, 1, 0, 0, 0, 0) #a population that does both
Tortvec3 <- cbind(AMP = TortAMP, 
                  ATT = TortATT,
                  BTH = TortBTH)
Tortp3.1 <- project(Tort, Tortvec3, time = 100, 
                    standard.A = TRUE, standard.vec = TRUE)
plot(Tortp3.1, log = "y"); lines(Tortpws, lty = 2)
( r3 <- apply(Tortvec3, 2, reac, A = Tort) )
( r3t <- rep(1, 3) )

( i3 <- apply(Tortvec3, 2, inertia, A = Tort) )
( i3t <- rep(100, 3) )

( max3 <- apply(Tortvec3[,c(1,3)], 2, maxamp, A = Tort) )
( max3t <- apply(Tortvec3[,c(1,3)], 2, function(x){
                 maxamp(vector = x, A = Tort, return.t = TRUE)$t}) )

( min3 <- apply(Tortvec3[,c(2,3)], 2, maxatt, A = Tort) )
( min3t <- apply(Tortvec3[,c(2,3)], 2, function(x){
                 maxatt(vector = x, A = Tort, return.t = TRUE )$t}) )

points(c(r3t, i3t, max3t, min3t), 
       c(r3, i3, max3, min3), 
       pch = 3, col = "red")

## ------------------------------------------------------------------------
plot(Tortp1.1s, log = "y", bounds = TRUE)


## ------------------------------------------------------------------------
plot(project(Tort, standard.A = TRUE), log = "y")


## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1)
plot(Tortp3.1, log = "y", bounds = TRUE)
lines(Tortpws, lty = 2)
( ruprB <- reac(Tort, bound = "upper") )

( rlwrB <- reac(Tort, bound = "lower") )

( iuprB <- inertia(Tort, bound = "upper") )

( ilwrB <- inertia(Tort, bound = "lower") )

( maxB <- maxamp(Tort, return.t = TRUE) )

( minB <- maxatt(Tort, return.t = TRUE) )

points(c(rep(1, 5), rep(100, 5), max3t, maxB$t, min3t, minB$t), 
       c(r3, ruprB, rlwrB, i3, iuprB, ilwrB, max3, maxB$maxamp, min3, minB$maxatt), 
       pch = 3, col = "red", 
       lwd = c(rep(c(1, 1, 1, 2, 2), 2), rep(c(1, 1, 2) ,2 )) )

## ----echo=-1-------------------------------------------------------------
par(mar = c(5, 4, 2, 2) + 0.1)
Tortpd <- project(Tort, "diri", time = 31,
                  standard.A = TRUE)
plot(Tortpd, plottype = "shady", bounds = T, log = "y")

## ------------------------------------------------------------------------
delta <- seq(0, 4*Tort[1, 6], 0.1)
Tort_delta <- Tort
lambda_delta <- numeric(length(delta))
for(i in 1:length(delta)){
    Tort_delta[1, 6] <- Tort[1, 6] + delta[i]
    lambda_delta[i] <- eigs(Tort_delta, "lambda")
}

plot(delta, lambda_delta, type = "l")

## ------------------------------------------------------------------------
sens(Tort)


## ------------------------------------------------------------------------
elas(Tort)


## ------------------------------------------------------------------------
delta <- seq(-0.2, 0.4, 0.01)
d1 <- c(0, 0, 0, 0, 0, 0, 1, 0)
e1 <- c(0, 0, 0, 0, 0, 1, 0, 0)
tf1 <- tfa_lambda(Tort, d = d1, e = e1, prange = delta)

plot(tf1)
s76 <- sens(Tort)[7, 6]
abline(eigs(Tort, "lambda"), s76, lty = 2)

## ------------------------------------------------------------------------
tfml <- tfam_lambda(Tort)
plot(tfml)

## ------------------------------------------------------------------------
Tortvec <- c(1, 1, 2, 3, 5, 8, 13, 21)
tfsm_inertia(Tort, Tortvec, tolerance=1e-5)


## ------------------------------------------------------------------------
tfsm_inertia(Tort, bound="upper", tolerance=1e-5)

tfsm_inertia(Tort, bound="lower", tolerance=1e-5)


## ------------------------------------------------------------------------
tfmi <- tfam_inertia(Tort, vector = Tortvec)
plot(tfmi)

## ------------------------------------------------------------------------
tfmi_upr <- tfam_inertia(Tort, bound="upper")
plot(tfmi_upr)
tfmi_lwr<-tfam_inertia(Tort, bound="lower")
plot(tfmi_lwr)

## ------------------------------------------------------------------------
data(Pbear); Pbear

## ------------------------------------------------------------------------
Pbearvec <- c(0.106, 0.068, 0.106, 0.461, 0.151, 0.108)

## ----echo = FALSE--------------------------------------------------------
Pbearpic <- magick::image_read("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Polar_Bears_Across_the_Arctic_Face_Shorter_Sea_Ice_Season_%2829664357826%29_%282%29.jpg/1024px-Polar_Bears_Across_the_Arctic_Face_Shorter_Sea_Ice_Season_%2829664357826%29_%282%29.jpg")
par(mar = c(0, 0, 0, 0))
plot(as.raster(Pbearpic))
text(10, 10, adj = c (0, 0), col = "white",
     "Polar bear (photo by NASA Goddard Space Flight Center from Greenbelt, MD, USA)")

## ------------------------------------------------------------------------
Pbearp1.1 <- project(Pbear, Pbearvec, time = 50)
plot(Pbearp1.1, log = "y")

## ------------------------------------------------------------------------
Aseq(Pbearp1.1)

nmat(Pbearp1.1)

mat(Pbearp1.1)


## ------------------------------------------------------------------------
p1 <- 0.4
( PbearM1 <- matrix(rep(c((1-p1)/3, (1-p1)/3, (1-p1)/3, p1/2, p1/2), 5), 5, 5) )


## ------------------------------------------------------------------------
Pbearp2.1 <- project(Pbear, Pbearvec, Aseq = PbearM1, time = 50)
plot(Pbearp2.1, log = "y")

## ------------------------------------------------------------------------
p2 <- 0.5
( PbearM2 <- matrix(rep(c((1-p2)/3, (1-p2)/3, (1-p2)/3, p2/2, p2/2), 5), 5, 5) )


## ------------------------------------------------------------------------
Pbearp2.2 <- project(Pbear, Pbearvec, Aseq = PbearM2, time = 50)
plot(Pbearp2.2, log = "y")

## ------------------------------------------------------------------------
p3 <- 0.8
( PbearM3 <- matrix(rep(c((1-p3)/3, (1-p3)/3, (1-p3)/3, p3/2, p3/2), 5), 5, 5) )

Pbearp2.3 <- project(Pbear, Pbearvec, Aseq = PbearM3, time = 50)
plot(Pbearp2.3, log = "y")

## ------------------------------------------------------------------------
p4 <- 0.2
q4 <- 0.8
( PbearM4 <- matrix(c(rep(c((1-p4)/3, (1-p4)/3, (1-p4)/3, p4/2, p4/2), 3),
                      rep(c((1-q4)/3, (1-q4)/3, (1-q4)/3, q4/2, q4/2), 2)),
                    5, 5) )


## ------------------------------------------------------------------------
Pbearp2.4 <- project(Pbear, Pbearvec, Aseq = PbearM4, time = 50)
plot(Pbearp2.4, log = "y")

## ------------------------------------------------------------------------
p5 <- 0.5
q5 <- 0.8
( PbearM5 <- matrix(c(rep(c((1-p5)/3, (1-p5)/3, (1-p5)/3, p5/2, p5/2), 3),
                      rep(c((1-q5)/3, (1-q5)/3, (1-q5)/3, q5/2, q5/2), 2)),
                    5, 5) )

Pbearp2.5 <- project(Pbear, Pbearvec, Aseq = PbearM5, time = 50)
plot(Pbearp2.5, log = "y")

## ------------------------------------------------------------------------
( Pbearseq <- rep(1:5, 10) )

Pbearp3.1 <- project(Pbear, Pbearvec, Aseq = Pbearseq)
plot(Pbearp3.1, log = "y")

## ------------------------------------------------------------------------
( Thistle <- Matlab2R("[0.5 0 2.8; 0.25 0.222 0; 0 0.667 0]") )

#we'll use a random vector for the models
Thistlevec <- runif(3); Thistlevec <- Thistlevec / sum(Thistlevec)

## ------------------------------------------------------------------------
x<- seq(0, 1, 0.01)
plot(x, dbeta(x, shape1 = 12, shape2 = 5), type = "l", ylab = "beta PDF")

## ------------------------------------------------------------------------
#create list of 30 matrices
ThistleS <- rep(list(Thistle), 30)
#generate beta-distributed random probability of flowering
times <- 30
pflwr <- rbeta(times, shape1 = 12, shape2 = 5)
#replace [3,2] element of every matrix with new random number
a32 <- 0.889*pflwr
a22 <- 0.889*(1-pflwr)
ThistleS <- mapply(function(A, r){A[3,2] <- r; A}, ThistleS, a32, SIMPLIFY = FALSE)
#replace [3,2] element of every matrix with new random number
ThistleS <- mapply(function(A, r){A[2,2] <- r; A}, ThistleS, a22, SIMPLIFY = FALSE)

## ------------------------------------------------------------------------
Thistlep1.1 <- project(ThistleS, vector = Thistlevec, Aseq = 1:30)
plot(Thistlep1.1, log = "y")
lines(0:30, project(Thistle, Thistlevec, time = 30), lty = 3)

## ------------------------------------------------------------------------
stoch(Pbear, c("lambda", "var"), vector = Pbearvec, Aseq = PbearM1,
      iterations = 3000, discard = 100)

stoch(Pbear, c("lambda", "var"), vector = Pbearvec, Aseq = PbearM2,
      iterations = 3000, discard = 100)

stoch(Pbear, c("lambda", "var"), vector = Pbearvec, Aseq = PbearM3,
      iterations = 3000, discard = 100)

stoch(Pbear, c("lambda", "var"), vector = Pbearvec, Aseq = PbearM4,
      iterations = 3000, discard = 100)

stoch(Pbear, c("lambda", "var"), vector = Pbearvec, Aseq = PbearM5,
      iterations = 3000, discard = 100)


## ------------------------------------------------------------------------
eigs(PbearM2, "ss")

eigs(PbearM4, "ss")


## ------------------------------------------------------------------------
eigs(PbearM5, "ss")


