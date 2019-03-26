## ----'preamble', include=FALSE, warning=FALSE, message=FALSE-------------
library(knitr)

# set the knitr options ... for everyone!
# if you unset this, then vignette build bonks. oh, joy.
#opts_knit$set(progress=TRUE)
opts_knit$set(eval.after='fig.cap')
# for a package vignette, you do want to echo.
# opts_chunk$set(echo=FALSE,warning=FALSE,message=FALSE)
opts_chunk$set(warning=FALSE,message=FALSE)
#opts_chunk$set(results="asis")
opts_chunk$set(cache=TRUE,cache.path="cache/rfin2016_")

#opts_chunk$set(fig.path="figure/",dev=c("pdf","cairo_ps"))
opts_chunk$set(fig.path="figure/rfin2016_",dev=c("pdf"))
opts_chunk$set(fig.width=5,fig.height=4,dpi=64)

# doing this means that png files are made of figures;
# the savings is small, and it looks like shit:
#opts_chunk$set(fig.path="figure/",dev=c("png","pdf","cairo_ps"))
#opts_chunk$set(fig.width=4,fig.height=4)
# for figures? this is sweave-specific?
#opts_knit$set(eps=TRUE)

# this would be for figures:
#opts_chunk$set(out.width='.8\\textwidth')
# for text wrapping:
options(width=64,digits=2)
opts_chunk$set(size="small")
opts_chunk$set(tidy=TRUE,tidy.opts=list(width.cutoff=50,keep.blank.line=TRUE))

compile.time <- Sys.time()

# from the environment

# only recompute if FORCE_RECOMPUTE=True w/out case match.
FORCE_RECOMPUTE <- 
	(toupper(Sys.getenv('FORCE_RECOMPUTE',unset='False')) == "TRUE")

# compiler flags!

# not used yet
LONG.FORM <- FALSE

mc.resolution <- ifelse(LONG.FORM,1000,200)
mc.resolution <- max(mc.resolution,100)

library(SharpeR)
library(madness)
library(dplyr)
library(lubridate)


ipdf <- data.frame(installed.packages(),stringsAsFactors=FALSE) 
madness_version <- ipdf[ipdf$Package=='madness','Version']

## ----'demo_1',echo=TRUE,cache=TRUE---------------------------------------
require(madness)
set.seed(1234)
X_NAMED <- array(rnorm(3),dim=c(3,1))
Xmad <- madness(X_NAMED)
show(Xmad)

## ----'demo_1more',echo=TRUE,cache=TRUE-----------------------------------
show(val(Xmad))
show(dvdx(Xmad))

## ----'demo_convert',echo=TRUE,cache=TRUE---------------------------------
set.seed(456)
a_df <- data.frame(x=rnorm(1000),y=runif(1000),z=runif(1000))
a_df$v <- rowSums(a_df) + rnorm(nrow(a_df))
beta <- lm(v ~ x + y + z,data=a_df)
bmad <- as.madness(beta,vtag='beta')
show(bmad)

## ----'demo_theta',echo=TRUE,cache=TRUE-----------------------------------
set.seed(789)
X <- matrix(rnorm(1000*3),ncol=3)
# one of these apparently does not run under alternative BLAS, and 
# so CRAN precludes me from executing this code in the vignette,
# but I cannot tell which because I cannot use those alternative BLAS,
# so I am commenting out this code, which is absurd.
#Xmad <- theta(X)
#show(Xmad)

# more 'exotic' variance-covariance:
library(sandwich)
set.seed(1111)
X <- matrix(rnorm(100*2),ncol=2)

#twom <- twomoments(X,vcov=sandwich::vcovHAC)
#show(twom)

## ----'demo_2',echo=TRUE,cache=TRUE---------------------------------------
set.seed(2223)
X <- matrix(runif(5*3),ncol=3)
Y <- matrix(rnorm(length(X)),ncol=ncol(X))
Xmad <- madness(X,xtag='v')
Ymad <- madness(Y,xtag='v')

Zmad <- Xmad + Ymad
# hadamard product:
Zmad <- Xmad * Ymad
# matrix product:
Zmad <- t(Xmad) %*% Ymad
# equivalently
Zmad <- crossprod(Xmad,Ymad)

# can also interact with a scalar:
Zmad <- Xmad + Y
Zmad <- t(Xmad) %*% Y
# and so on.

# not sure _why_ you want to do these, but they can be done:
foo <- Xmad ^ Ymad
foo <- log(Xmad)
foo <- outer(Xmad,Y,'+')

# some sums and such:
cboth <- c(colSums(Xmad),colSums(Ymad))
xsum <- sum(Xmad)

# square matrix operations:
Zmad <- crossprod(Xmad,Ymad)
foo <- matrix.trace(Zmad)
foo <- det(Zmad)
invZ <- solve(Zmad)
invZ <- solve(Zmad,crossprod(Y,Y))

# and so on...


## ----'quandl_data',echo=FALSE,cache=TRUE---------------------------------
data(wff3)
data(stock_returns)

## ----'sr_demo_1',echo=TRUE,cache=TRUE------------------------------------
data(wff3)
wff3$Mkt_RF <- wff3$Mkt - wff3$RF
ff3 <- wff3[,c('Mkt_RF','SMB','HML')]
# compute first and second moments:
# (beware: this method will not scale to larges numbers of assets!)
two <- twomoments(ff3,diag.only=TRUE)
# annualization factor:
ope <- 52
srs <- sqrt(ope) * two$mu / sqrt(two$sigmasq)

show(val(srs))
show(vcov(srs))

# for comparison:
library(SharpeR)
show(sr_vcov(as.matrix(ff3),ope=ope))

## ----'sr_demo_2',echo=TRUE,cache=TRUE------------------------------------
# test whether SMB has same signal-noise as HML:
testv <- t(srs) %*% array(c(0,-1,1),dim=c(3,1))
# now the Wald statistic:
wald <- as.numeric(val(testv)) / sqrt(diag(vcov(testv))) 
show(wald)

## ----'overfit_0',echo=FALSE,cache=TRUE-----------------------------------
n_features <- 25
n_backtests <- 400
n_days <- 253 * 7
true_beta <- c(c(0.20,-0.10),rep(0,n_features-2))
set.seed(2356)
F_matrix <- matrix(runif(n_features*n_backtests),ncol=n_backtests)
# normalize:
F_matrix <- t(t(F_matrix) / sqrt(colSums(F_matrix^2)))
# latent returns, independent, identical variance, different means.
sigma <- 0.013
LRets <- matrix(rnorm(n_features*n_days,sd=sigma),nrow=n_days)
LRets <- t(t(LRets) + true_beta * sigma)
# manifest returns:
Rets <- LRets %*% F_matrix
# suppose only a subset of the features are actually measured though:
n_latent_feat <- 5
F_mat <- F_matrix[1:n_latent_feat,]
sub_beta <- true_beta[1:nrow(F_mat)]

## ----'overfit_1',echo=TRUE,cache=TRUE------------------------------------
show(dim(Rets))
show(dim(F_mat))
# use madness.
two <- twomoments(Rets,diag.only=TRUE)
srs <- two$mu / sqrt(two$sigmasq)

# the normal equations method. This is typically numerically unstable and
# not recommended, but I have not implemented QR factorization yet...
betahat <- solve(tcrossprod(F_mat,F_mat),F_mat %*% srs)
show(val(t(betahat)))
marginal_wald <- val(betahat) /sqrt(diag(vcov(betahat)))
show(t(marginal_wald))

## ----'fsr_show',echo=TRUE,cache=TRUE-------------------------------------
data(wff3)
data(stock_returns)
allweekly <- stock_returns %>%   
	mutate(AAPL=100*AAPL,IBM=100*IBM) %>%  
	left_join(wff3,by='Date') %>%
	mutate(Mkt_RF=Mkt - RF) %>% 
	dplyr::select(-Mkt)

tail(allweekly,6) %>% dplyr::select(-RF) %>% knitr::kable(row.names=FALSE)

## ----'fsr_noshow',echo=FALSE,cache=TRUE----------------------------------
usenames <- gsub('_','\\_',colnames(allweekly))

## ----'fsr_demo_1',echo=TRUE,cache=TRUE-----------------------------------
tht <- theta(allweekly %>% dplyr::select(AAPL,IBM,Mkt_RF,SMB,HML) %>% mutate(one=1.0),xtag='stocks')

thinv_aapl <- chol(solve(tht[c(1,3,4,5,6),c(1,3,4,5,6)]))
thinv_ibm <- chol(solve(tht[c(2,3,4,5,6),c(2,3,4,5,6)]))
r0 <- 1e-4
v <- c(0,0,0,1)
r0v <- array(c(r0,v),dim=c(5,1))

exfacsr_aapl <- -(t(r0v) %*% t(thinv_aapl))[1,1] 
exfacsr_ibm <- -(t(r0v) %*% t(thinv_ibm))[1,1] 
exfacsr <- c(exfacsr_aapl,exfacsr_ibm)

show(cov2cor(vcov(exfacsr)))

waldboth <- val(exfacsr) / sqrt(diag(vcov(exfacsr)))
show(waldboth)

## ----'fsr_demo_2',echo=TRUE,cache=TRUE-----------------------------------
isbigger <- array(c(1,-1),dim=c(1,2)) %*% exfacsr 
show(val(isbigger) / sqrt(diag(vcov(isbigger))))

## ----'the_mp_1',echo=TRUE,cache=TRUE-------------------------------------
library(sandwich)
twom <- twomoments(allweekly %>% select(AAPL,IBM,Mkt_RF,SMB,HML),vcov=sandwich::vcovHAC,diag.only=FALSE)
the_mp <- solve(twom$Sigma,twom$mu)
show(val(t(the_mp)))
show(vcov(the_mp))
# let's normalize to unit gross leverage:
mp_norm <- outer(the_mp,norm(the_mp,'1'),'/')
dim(mp_norm) <- dim(the_mp)

show(val(t(mp_norm)))
show(cov2cor(vcov(mp_norm)))

## ----'the_mp_2',echo=TRUE,cache=TRUE-------------------------------------
library(sandwich)
tht <- theta(allweekly %>% mutate(one=1.0) %>% select(one,AAPL,IBM,Mkt_RF,SMB,HML),
	xtag='all5',vcov=sandwich::vcovHAC)

## ----'the_mp_3',echo=TRUE,cache=TRUE-------------------------------------
rnk <- 2
ev <- eigen(tht,symmetric=TRUE)
evals <- ev$values[,1:rnk]
evecs <- ev$vectors[,1:rnk]
thtinv <- evecs %*% todiag(evals^-1) %*% t(evecs)

the_mp2 <- - thtinv[2:nrow(thtinv),1]
show(val(t(the_mp2)))
show(vcov(the_mp2))

## ----'correlation_show_0',echo=FALSE,cache=TRUE--------------------------
data(wff3)
wff3$Mkt_RF <- wff3$Mkt - wff3$RF
ff3 <- wff3[,c('Mkt_RF','SMB','HML')]
#usenames <- gsub('_','\\_',colnames(ff3))
usenames <- gsub('_','',colnames(ff3))

## ----'correlation_show_1',echo=TRUE,cache=TRUE---------------------------
library(sandwich)
data(wff3)
wff3$Mkt_RF <- wff3$Mkt - wff3$RF
ff3 <- wff3[,c('Mkt_RF','SMB','HML')]
# compute first and second moments:
two <- twomoments(ff3,vcov=sandwich::vcovHAC)
# basically cov2cor:
fcorr <- two$Sigma / tcrossprod(sqrt(diag(two$Sigma)))  
show(val(fcorr))
# compute the Wald statistic of the off-diagonal correlations:
odiag <- vech(fcorr,-1)
wald <- val(odiag) / sqrt(diag(vcov(odiag)))
show(wald)

## ----'as_objective_1',echo=TRUE,cache=TRUE-------------------------------
fitfun <- function(R,L,Y,nu=-0.1) {
	Rmad <- madness(R)
	dim(Rmad) <- c(ncol(L),ncol(Y))
	Err <- Y - L %*% Rmad
	penalty <- sum(exp(nu * Rmad))
	fit <- norm(Err,'f') + penalty
	# convert to an objective:
	to_objective(fit)
}
set.seed(1234)
L <- array(runif(30*5),dim=c(30,5)) 
Y <- array(runif(nrow(L)*20),dim=c(nrow(L),20))
R0 <- array(runif(ncol(L)*ncol(Y)),dim=c(ncol(L),ncol(Y)))
Rk <- nlm(fitfun, R0, L, Y, iterlim=30)

show(c(fitfun(R0,L,Y)))
show(c(fitfun(Rk$estimate,L,Y)))

## ----gen_bibliography,echo=FALSE-----------------------------------------
# generate the bibliography#FOLDUP
#see also
#http://r.789695.n4.nabble.com/Automating-citations-in-Sweave-td872079.html

#FID <- file("rauto.bib", "w")  # open an output file connection

cite.by.name <- function(x){ 
	res <- toBibtex(citation(x)) 
	if (is.list(res)) res <- res[[1]] 
	#2FIX: multiple citations; bleah;
	tofix <- grep("^@.+",res)
	fidx <- tofix[1]
	res[fidx] <- sub("{",paste("{",x,sep=''),res[fidx],fixed=TRUE) 

	if (length(tofix) > 1) {
		for (fidx in tofix[2:length(tofix)]) {
			res[fidx] <- sub("{",paste("{",x,"_",fidx,sep=''),res[fidx],fixed=TRUE) 
		}
	}
	cat(res,file = FID, sep = "\n")
	return(NULL)
} 
#z <- sapply( .packages(TRUE), function(x) try( cite.by.name(x) ) )
#close(FID)
#UNFOLD

