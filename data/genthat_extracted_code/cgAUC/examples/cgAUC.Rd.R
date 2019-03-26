library(cgAUC)


### Name: cgAUC
### Title: Calculate AUC when gold standard is continuous with large
###   variables.
### Aliases: cgAUC
### Keywords: cgAUC

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

# n = 100; p = 5;
# r.x = matrix(rnorm(n * p), , p) # raw data
# r.z = r.x[ ,1] + rnorm(n) # gold standard
# x = scale(r.x) # standardized of raw data
# z = scale(r.z) # standardized of gold standard
# h = n^(-1 / 2)
# t1 = cgAUC(r.x, r.z, h, delta = 1, auto = FALSE, tau = 1, scale = 1) # the delta be constant
# t1
# t2 = cgAUC(r.x, r.z, h, delta = 1, auto = TRUE, tau = 1, scale = 1) # the delta be variable
# t2

## The function is currently defined as
function (x, z, h, delta = 1, auto = FALSE, tau = 1)
{
	x = scale(x)
	z = scale(z)
	conv = FALSE
	n = dim(x)[1]
	p = dim(x)[2]
	cntin.ri = dscrt.ri = rep(0, p)
	id = diag(p)
	for (i in 1:p) {
		dscrt.ri[i] = dscrt(x, z, id[i, ])$theta.h.p
		cntin.ri[i] = cntin(x, z, id[i, ], h)$theta.sh.h.p
	}
	beta.i = ifelse(cntin.ri > 0.5, 1, -1)
	dscrt.ri = ifelse(dscrt.ri > 0.5, dscrt.ri, (1 - dscrt.ri))
	cntin.ri = ifelse(cntin.ri > 0.5, cntin.ri, (1 - cntin.ri))
	y = x * matrix(beta.i, n, p, byrow = TRUE)
	max.x = which(cntin.ri == max(cntin.ri))
	theta.sh.h.p = 0
	l = id[max.x, ]
	while (conv == FALSE) {
		d.l = d.theta.sh.h.p(y, z, l, h)
		max.d.l = max(d.l)
		ind.d.l = ifelse(d.l >= (tau * max.d.l), 1, 0) * d.l
		if (auto == TRUE) {
			delta = optimal.delta(y, z, l, h, ind.d.l)
		}
		l = l + delta * ind.d.l
		l = l/max(l)
		theta.temp = cntin(y, z, l, h)$theta.sh.h.p
		ifelse(abs(theta.temp - theta.sh.h.p) < 1e-04, conv <- TRUE, conv <- FALSE)
		theta.sh.h.p = theta.temp
	}
	optimal.dscrt = dscrt(y, z, l)
	theta.sh.h.p.var = cntin(y, z, l, h)$var
	l = l * beta.i
	return(list(l = l, theta.sh.h.p = theta.sh.h.p, theta.sh.h.p.var = theta.sh.h.p.var,
				cntin.ri = cntin.ri, theta.h.p = optimal.dscrt$theta.h.p,
				theta.h.p.var = optimal.dscrt$var, dscrt.ri = dscrt.ri,
				delta = delta))
}
## The function is currently defined as
function (x, z, h, delta = 1, auto = FALSE, tau = 1) 
{
    x = scale(x)
    z = scale(z)
    conv = FALSE
    n = dim(x)[1]
    p = dim(x)[2]
    cntin.ri = dscrt.ri = rep(0, p)
    id = diag(p)
    for (i in 1:p) {
        dscrt.ri[i] = dscrt(x, z, id[i, ])$theta.h.p
        cntin.ri[i] = cntin(x, z, id[i, ], h)$theta.sh.h.p
    }
    beta.i = ifelse(cntin.ri > 0.5, 1, -1)
    dscrt.ri = ifelse(dscrt.ri > 0.5, dscrt.ri, (1 - dscrt.ri))
    cntin.ri = ifelse(cntin.ri > 0.5, cntin.ri, (1 - cntin.ri))
    y = x * matrix(beta.i, n, p, byrow = TRUE)
    max.x = which(cntin.ri == max(cntin.ri))
    theta.sh.h.p = 0
    l = id[max.x, ]
    while (conv == FALSE) {
        d.l = d.theta.sh.h.p(y, z, l, h)
        max.d.l = max(d.l)
        ind.d.l = ifelse(d.l >= (tau * max.d.l), 1, 0) * d.l
        if (auto == TRUE) {
            delta = optimal.delta(y, z, l, h, ind.d.l)
        }
        l = l + delta * ind.d.l
        l = l/max(l)
        theta.temp = cntin(y, z, l, h)$theta.sh.h.p
        ifelse(abs(theta.temp - theta.sh.h.p) < 1e-04, conv <- TRUE, 
            conv <- FALSE)
        theta.sh.h.p = theta.temp
    }
    optimal.dscrt = dscrt(y, z, l)
    theta.sh.h.p.var = cntin(y, z, l, h)$var
    l = l * beta.i
    return(list(l = l, theta.sh.h.p = theta.sh.h.p, theta.sh.h.p.var = theta.sh.h.p.var, 
        cntin.ri = cntin.ri, theta.h.p = optimal.dscrt$theta.h.p, 
        theta.h.p.var = optimal.dscrt$var, dscrt.ri = dscrt.ri, 
        delta = delta))
  }



