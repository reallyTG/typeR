library(cit)


### Name: fdr.q.para
### Title: Parametric tail-area FDR Values, q-values
### Aliases: fdr.q.para
### Keywords: parametric

### ** Examples

# Sample Size
ss = 100

n.tests = 20
mypvals = rep(NA, n.tests)

for( tst in 1:n.tests ){

	# Errors
	e1 = matrix(rnorm(ss),ncol=1)
	e2 = matrix(rnorm(ss),ncol=1)

	# Simulate genotypes, gene expression, and clinical traits
	L = matrix(rbinom(ss,2,.5),ncol=1)
	G =  matrix(.5*L + e1,ncol=1)
	T =  matrix(.3*G + e2,ncol=1)
	T = ifelse( T > median(T), 1, 0 )

	mypvals[ tst ] = cit.bp(L, G, T)$p_cit
}
fdr.q.para( mypvals )




