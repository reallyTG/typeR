## ----echo=FALSE, include=FALSE----------------------------------------------------------
require(knitr)
options(width = 90, prompt="> ")
knit_hooks$set(fig.mar=function() par(mar=c(5.1,4.1,3.1,2.1)))
opts_chunk$set(out.width='0.4\\textwidth', fig.align='center', highlight=TRUE, comment=NA, fig.height=6, fig.width=6)
opts_knit$set(unnamed.chunk.label='gaston')

## ----prompton, echo=FALSE---------------------------------------------------------------
opts_chunk$set(prompt=TRUE, continue = " ");

## ----promptoff, echo=FALSE--------------------------------------------------------------
opts_chunk$set(prompt=FALSE, continue=" ");

## ----echo=FALSE-------------------------------------------------------------------------
opts_chunk$set(prompt=TRUE, continue = " ");

## ----desc, include=FALSE, echo=FALSE----------------------------------------------------
require(gaston)
desc <- packageDescription("gaston")

## ---------------------------------------------------------------------------------------
x <- read.bed.matrix( system.file("extdata", "LCT.bed", package="gaston") )
x

## ---------------------------------------------------------------------------------------
x <- read.bed.matrix( system.file("extdata", "LCT.bed", package="gaston"), rds = NULL )
x

## ---------------------------------------------------------------------------------------
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
x

## ---------------------------------------------------------------------------------------
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
slotNames(x)

## ---------------------------------------------------------------------------------------
x@bed

## ---------------------------------------------------------------------------------------
dim(x@ped)
head(x@ped)

## ---------------------------------------------------------------------------------------
dim(x@snps)
head(x@snps)

## ---------------------------------------------------------------------------------------
options(gaston.auto.set.stats = FALSE)
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
head(x@ped)
head(x@snps)

## ---------------------------------------------------------------------------------------
x <- set.stats(x)
head(x@ped)

## ---------------------------------------------------------------------------------------
head(x@snps)

## ---------------------------------------------------------------------------------------
str(x@p)
str(x@mu)
str(x@sigma)

## ----fig.mar=TRUE, fig.width=10, out.width='0.7\\textwidth'-----------------------------
plot(x@p, x@sigma, xlim=c(0,1))
t <- seq(0,1,length=101);
lines(t, sqrt(2*t*(1-t)), col="red")

## ---------------------------------------------------------------------------------------
head(x@p)
y <- x[1:30,]
head(y@p)
y <- set.stats(y, set.p = FALSE)
head(y@p)
y <- set.stats(y)
head(y@p)

## ---------------------------------------------------------------------------------------
options(gaston.auto.set.stats = TRUE)

## ---------------------------------------------------------------------------------------
x[1:100,]
x[1:100,10:19]

## ---------------------------------------------------------------------------------------
x[,x@snps$maf > 0.1]

## ---------------------------------------------------------------------------------------
x <- set.hwe(x)
select.snps(x, maf > 0.1 & hwe > 1e-3)

## ---------------------------------------------------------------------------------------
data(AGT)
x1 <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)
x1
data(LCT)
x2 <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)
x2
x <- cbind(x1,x2)
x

## ---------------------------------------------------------------------------------------
x3 <- x[1:10, ]
x4 <- x[-(1:10), ]
rbind(x3,x4)

## ---------------------------------------------------------------------------------------
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
X <- as.matrix(x)
X[1:5,1:4]

## ---------------------------------------------------------------------------------------
standardize(x) <- "mu"
as.matrix(x)[1:5, 1:4] 

## ---------------------------------------------------------------------------------------
scale(X)[1:5,1:4]

## ---------------------------------------------------------------------------------------
standardize(x) <- "p"
as.matrix(x)[1:5, 1:4] 
scale(X, scale = sqrt(2*x@p*(1-x@p)))[1:5,1:4]

## ---------------------------------------------------------------------------------------
y <- x %*% c(rep(0,350),0.25,rep(0,ncol(x)-351)) + rnorm(nrow(x), sd = 1)

## ---------------------------------------------------------------------------------------
x <- read.bed.matrix( system.file("extdata", "chr2.bed", package="gaston") )
x
head(x@ped)
table(x@ped$population)

## ---------------------------------------------------------------------------------------
K <- GRM(x)

eiK <- eigen(K)
# deal with a small negative eigen value
eiK$values[ eiK$values < 0 ] <- 0

## ----fig.mar=TRUE-----------------------------------------------------------------------
PC <- sweep(eiK$vectors, 2, sqrt(eiK$values), "*")
plot(PC[,1], PC[,2], col=x@ped$population)
legend("bottomleft", pch = 1, legend = levels(x@ped$population), col = 1:5)

## ---------------------------------------------------------------------------------------
# one can use PC[,1:2] instead of eiK$vectors[,1:2] as well
L <- bed.loadings(x, eiK$vectors[,1:2])
dim(L)
head(L)

## ---------------------------------------------------------------------------------------
colSums(L**2)

## ---------------------------------------------------------------------------------------
standardize(x) <- 'p'
head( (x %*% L) / sqrt(ncol(x)-1) )
head( PC[,1:2] )

## ---------------------------------------------------------------------------------------
data(AGT)
x <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)

ld.x <- LD(x, c(1,ncol(x)))

LD.plot(ld.x, snp.positions = x@snps$pos, write.ld = NULL, 
        max.dist = 20e3, write.snp.id = FALSE, draw.chr = FALSE, 
        pdf = "LD_AGT.pdf")

## ---------------------------------------------------------------------------------------
y <- LD.thin(x, threshold = 0.4, max.dist = 500e3)
y

## ---------------------------------------------------------------------------------------
ld.y <- LD( y, lim = c(1, ncol(y)) )
sum( ld.y > 0.4 )

## ---------------------------------------------------------------------------------------
set.seed(1)
n <- 100
q1 <- 20
Z1 <- matrix( rnorm(n*q1), nrow = n )
X <- cbind(1, 5*runif(n))

## ---------------------------------------------------------------------------------------
u1 <- rnorm(q1, sd = sqrt(2))
y <- X %*% c(1,2) + Z1 %*% u1 + rnorm(n, sd = sqrt(3))

## ---------------------------------------------------------------------------------------
q2 <- 10
Z2 <- matrix( rnorm(n*q2), nrow = n ) 
u2 <- rnorm(q2, sd = 1)
y2 <- X %*% c(1,2) + Z1 %*% u1 + Z2 %*% u2 + rnorm(n, sd = sqrt(3))

## ---------------------------------------------------------------------------------------
K1 <- tcrossprod(Z1)
fit <- lmm.aireml(y, X, K = K1, verbose = FALSE)
str(fit)

## ----fig.mar=TRUE, fig.width=12, out.width='0.7\\textwidth'-----------------------------
par(mfrow = c(1, 2))
plot(Z1 %*% u1, fit$BLUP_omega); abline(0, 1, lty = 2, col = 3)
BLUP_u1 <- fit$tau * t(Z1) %*% fit$Py
plot(u1, BLUP_u1); abline(0, 1, lty = 2, col = 3)

## ---------------------------------------------------------------------------------------
K2 <- tcrossprod(Z2)
fit2 <- lmm.aireml(y2, X, K = list(K1, K2), verbose = FALSE)
str(fit2)

## ----fig.mar=TRUE, fig.width=12, out.width='0.7\\textwidth'-----------------------------
par(mfrow = c(1, 2))
omega1 <- fit2$tau[1] * K1 %*% fit2$Py
omega2 <- fit2$tau[2] * K2 %*% fit2$Py
plot(Z1 %*% u1, omega1); abline(0, 1, lty = 2, col = 3)
plot(Z2 %*% u2, omega2); abline(0, 1, lty = 2, col = 3)

## ---------------------------------------------------------------------------------------
eiK1 <- eigen(K1)
fit.d <- lmm.diago(y, X, eiK1)
str(fit.d)

## ----fig.mar=TRUE-----------------------------------------------------------------------
TAU <- seq(0.5,2.5,length=50)
S2 <- seq(2.5,4,length=50)
lik <- lmm.diago.likelihood(tau = TAU, s2 = S2, Y = y, X = X, eigenK = eiK1)
lik.contour(TAU, S2, lik, heat = TRUE, xlab = "tau", ylab = "sigma^2")

## ---------------------------------------------------------------------------------------
set.seed(1)
n <- 2000
R <- random.pm(n)
y <- 2 + lmm.simu(tau = 1, sigma2 = 2, eigenK = R$eigen)$y

## ---------------------------------------------------------------------------------------
fit <- lmm.diago(y, eigenK = R$eigen)

## ----echo=FALSE-------------------------------------------------------------------------
h2 <- fit$tau/(fit$tau + fit$sigma)

## ----fig.mar=TRUE-----------------------------------------------------------------------
H2 <- seq(0,1,length=51)
lik <- lmm.diago.likelihood(h2 = H2, Y = y, eigenK = R$eigen)
plot(H2, exp(lik$likelihood-max(lik$likelihood)), type="l", yaxt="n", ylab="likelihood")

## ---------------------------------------------------------------------------------------
PC <- sweep(R$eigen$vectors, 2, sqrt(R$eigen$values), "*")
y1 <- 2 + PC[,1:2] %*% c(5,5) + lmm.simu(tau = 1, sigma2 = 2, eigenK = R$eigen)$y

## ---------------------------------------------------------------------------------------
fit0 <- lmm.diago(y1, eigenK = R$eigen)
fit0$tau/(fit0$tau+fit0$sigma2)
fit10 <- lmm.diago(y1, eigenK = R$eigen, p = 10)
fit10$tau/(fit10$tau+fit10$sigma2)

## ---------------------------------------------------------------------------------------
data(AGT)
x <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)
standardize(x) <- 'mu'

## ---------------------------------------------------------------------------------------
set.seed(1)
R <- random.pm(nrow(x))

## ---------------------------------------------------------------------------------------
y <- 2 + x %*% c(rep(0,350),0.25,rep(0,ncol(x)-351)) +
     lmm.simu(tau = 0.3, sigma2 = 1, eigenK=R$eigen)$y

## ----fig.mar=TRUE-----------------------------------------------------------------------
t_score <- association.test(x, y, K = R$K, method = "lmm")
t_wald <- association.test(x, y, eigenK = R$eigen, method = "lmm", test = "wald")
plot( t_score$p, t_wald$p, log = "xy", xlab = "score", ylab = "wald")

## ----fig.mar=TRUE, fig.width=12, out.width='0.7\\textwidth'-----------------------------
plot(-log10(t_score$p), xlab="SNP index", ylab = "-log(p)",
      col = c(rep(1,350),2,rep(1,ncol(x)-351)))

## ----fig.mar=TRUE-----------------------------------------------------------------------
lds <- LD(x, 351, c(1,ncol(x)))
plot(lds, -log10(t_score$p), xlab="r^2", ylab="-log(p)")

## ----fig.mar=TRUE, fig.width=12, out.width='0.7\\textwidth'-----------------------------
y1 <- as.numeric(y > mean(y))
t_binary <- association.test(x, y1, K = R$K, method = "lmm", response = "binary")
# (mini) Manhattan plot
plot(-log10(t_binary$p), xlab="SNP index", ylab = "-log(p)",
      col = c(rep(1,350),2,rep(1,ncol(x)-351)))

