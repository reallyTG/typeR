## ----setup,echo=FALSE,cache=FALSE,results='hide',message=FALSE-----------
library('knitr')
opts_chunk$set(echo=TRUE,message=FALSE,
		dev='pdf', 
		fig.align='default',width=80,
		fig.height=5,fig.width=6,out.width="0.5\\textwidth",
		dev.args=list(bg='white')
)

## ----library-------------------------------------------------------------
library('skellam')

## ----parameters----------------------------------------------------------
N = 5000
lambda1 = 1.5
lambda2 = 0.5

## ----simulation----------------------------------------------------------
X = rpois(N, lambda1)
Y = rpois(N, lambda2)
XminusY = X - Y
Z = rskellam(N, lambda1, lambda2)

## ----theFigures, fig.cap=paste('Differences of Poisson and Skellam with parameters ', lambda1, ' and ', lambda2), fig.subcap=c('densities','quantiles'), echo=TRUE----

plot(table(XminusY), xlab='X - Y', ylab='', type='p', pch=1)
points(table(Z), col='red', type='p', pch=3, cex=2)
xseq = seq(floor(par('usr')[1]), ceiling(par('usr')[2]))
points(xseq, N*dskellam(xseq, lambda1, lambda2), col='blue',
    pch=4, cex=3)
legend('topright', pch=c(1,3,4), col=c('black','red','blue'),
    legend=c('rpois-rpois', 'rskellam', 'dskellam'))

Sprob = seq(0,1,by=1/100)
qZ = quantile(Z, prob=Sprob)
plot(qZ, qskellam(Sprob, lambda1, lambda2))
abline(c(0,1), col='#FF000040')


## ----parAgain, echo=FALSE------------------------------------------------
lambda1 = 0.5
lambda2 = 1.25

## ----simulationAgain, echo=FALSE-----------------------------------------
X = rpois(N, lambda1)
Y = rpois(N, lambda2)
XminusY = X - Y
Z = rskellam(N, lambda1, lambda2)

## ----theFiguresAgain, fig.cap=paste('Differences of Poisson and Skellam with parameters ', lambda1, ' and ', lambda2), fig.subcap=c('densities','quantiles'), echo=FALSE----

plot(table(XminusY), xlab='X - Y', ylab='', type='p', pch=1)
points(table(Z), col='red', type='p', pch=3, cex=2)
xseq = seq(floor(par('usr')[1]), ceiling(par('usr')[2]))
points(xseq, N*dskellam(xseq, lambda1, lambda2), col='blue',
    pch=4, cex=3)
legend('topright', pch=c(1,3,4), col=c('black','red','blue'),
    legend=c('rpois-rpois', 'rskellam', 'dskellam'))

Sprob = seq(0,1,by=1/100)
qZ = quantile(Z, prob=Sprob)
plot(qZ, qskellam(Sprob, lambda1, lambda2))
abline(c(0,1), col='#FF000040')


## ----parLarge, echo=FALSE------------------------------------------------
lambda1 = 12
lambda2 = 8

## ----simulationLarge, echo=FALSE-----------------------------------------
X = rpois(N, lambda1)
Y = rpois(N, lambda2)
XminusY = X - Y
Z = rskellam(N, lambda1, lambda2)

## ----theFiguresLarge, fig.cap=paste('Differences of Poisson and Skellam with parameters ', lambda1, ' and ', lambda2), fig.subcap=c('densities','quantiles'), echo=FALSE----

plot(table(XminusY), xlab='X - Y', ylab='', type='p', pch=1)
points(table(Z), col='red', type='p', pch=3, cex=2)
xseq = seq(floor(par('usr')[1]), ceiling(par('usr')[2]))
points(xseq, N*dskellam(xseq, lambda1, lambda2), col='blue',
    pch=4, cex=3)
legend('topright', pch=c(1,3,4), col=c('black','red','blue'),
    legend=c('rpois-rpois', 'rskellam', 'dskellam'))

Sprob = seq(0,1,by=1/100)
qZ = quantile(Z, prob=Sprob)
plot(qZ, qskellam(Sprob, lambda1, lambda2))
abline(c(0,1), col='#FF000040')


