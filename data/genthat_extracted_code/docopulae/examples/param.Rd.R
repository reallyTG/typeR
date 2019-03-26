library(docopulae)


### Name: param
### Title: Parametric Model
### Aliases: param

### ** Examples

## No test: 
library(copula)


dfltNCube = nint_integrateNCube

## prepare for SparseGrid integration
ncube = function(dimension) {
    SparseGrid::createIntegrationGrid('GQU', dimension, 3)
}
ncube = nint_integrateNCube_SparseGrid(ncube)
unlockBinding('nint_integrateNCube', environment(nint_integrate))
assign('nint_integrateNCube', ncube, envir=environment(nint_integrate))


## general settings
numDeriv = FALSE


## build pdf, derivatives
etas = function(theta) with(theta, {
    xx = x^(0:4)
    c(c(beta1, beta2, beta3) %*% xx[c(1, 2, 3)], # x^c(0, 1, 2)
      c(beta4, beta5, beta6) %*% xx[c(2, 4, 5)]) # x^c(1, 3, 4)
})

copula = claytonCopula()
alphas = c('alpha')

parNames = c(paste('beta', 1:6, sep=''), alphas)

if (numDeriv) {
    margins = function(y, theta, ...) {
        e = etas(theta)
        cbind(dnorm(y, mean=e, sd=1), pnorm(y, mean=e, sd=1))
    }
    f = buildf(margins, TRUE, copula, parNames=alphas)

    d2logf = numDeriv2Logf(f)

} else {
    es = list(
        eta1=quote(theta$beta1 + theta$beta2*theta$x + theta$beta3*theta$x^2),
        eta2=quote(theta$beta4*theta$x + theta$beta5*theta$x^3 + theta$beta6*theta$x^4))

    margins = list(list(pdf=substitute(dnorm(y[1], mean=eta1, sd=1), es),
                        cdf=substitute(pnorm(y[1], mean=eta1, sd=1), es)),
                   list(pdf=substitute(dnorm(y[2], mean=eta2, sd=1), es),
                        cdf=substitute(pnorm(y[2], mean=eta2, sd=1), es)))
    pn = as.list(alphas); names(pn) = alphas # map parameter to variable
    f = buildf(margins, TRUE, copula, parNames=pn)

    cat('building derivatives ...')
    tt = system.time(d2logf <- Deriv2Logf(f, parNames))
    cat('\n')
    print(tt)
}

f
str(d2logf)


## param
model = function(theta) {
    integrand = function(y, theta, i, j)
        -d2logf(y, theta, i, j) * f(y, theta)

    yspace = nint_space(nint_intvDim(-Inf, Inf),
                        nint_intvDim(-Inf, Inf))

    fisherIf = function(x) {
        theta$x = x

        ## probability integral transform
        e = etas(theta)

        tt = nint_transform(integrand, yspace, list(list(
            dIdcs=1:2,
            g=function(y) pnorm(y, mean=e, sd=1),
            giDg=function(z) {
                t1 = qnorm(z, mean=e, sd=1)
                list(t1, dnorm(t1, mean=e, sd=1))
            }
        )))

        fisherI(tt$f, theta, parNames, tt$space)
    }

    return(param(fisherIf, 1))
}

theta = list(beta1=1, beta2=1, beta3=1,
             beta4=1, beta5=1, beta6=1,
             alpha=iTau(copula, 0.5), x=0)
m = model(theta)

## update.param
system.time(m <- update(m, matrix(seq(0, 1, length.out=101), ncol=1)))

## find D-optimal design
D = Dsensitivity(defaults=list(x=m$x, desx=m$x, mod=m))

d <- Wynn(D, 7.0007, maxIter=1e4)
d$tag$Wynn$tolBreak

dev.new(); plot(d, sensTol=7, main='d')

getM(m, d)

rd = reduce(d, 0.05)
cbind(x=rd$x, w=rd$w)

dev.new(); plot(rd, main='rd')

try(getM(m, rd))
m2 = update(m, rd)
getM(m2, rd)

## find Ds-optimal design
s = c(alphas, 'beta1', 'beta2', 'beta3')
Ds = Dsensitivity(A=s, defaults=list(x=m$x, desx=m$x, mod=m))

ds <- Wynn(Ds, 4.0004, maxIter=1e4)
ds$tag$Wynn$tolBreak

dev.new(); plot(reduce(ds, 0.05), sensTol=4, main='ds')

## create custom design
n = 4
d2 = design(x=matrix(seq(0, 1, length.out=n), ncol=1), w=rep(1/n, n))

m = update(m, d2)
dev.new(); plot(d2, sensx=d$x, sens=D(x=d$x, desx=d2$x, desw=d2$w, mod=m),
                sensTol=7, main='d2')

## compare designs
Defficiency(ds, d, m)
Defficiency(d, ds, m, A=s) # Ds-efficiency
Defficiency(d2, d, m)
Defficiency(d2, ds, m) # D-efficiency

## end with nice plot
dev.new(); plot(rd, main='rd')


assign('nint_integrateNCube', dfltNCube, envir=environment(nint_integrate))
## End(No test)



