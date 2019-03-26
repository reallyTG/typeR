library(cit)


### Name: fdr.cit
### Title: Omnibus FDR Values for CIT
### Aliases: fdr.cit
### Keywords: nonparametric

### ** Examples

# Sample Size
ss = 100
n.perm = 20
perm.index = matrix(NA, nrow=ss, ncol=n.perm )
for( j in 1:ncol(perm.index) ) perm.index[, j] = sample( 1:ss )

n.tests = 20
myresults = vector('list', n.tests)

for( tst in 1:n.tests ){

	# Errors
	e1 = matrix(rnorm(ss),ncol=1)
	e2 = matrix(rnorm(ss),ncol=1)

	# Simulate genotypes, gene expression, and clinical traits
	L = matrix(rbinom(ss,2,.5),ncol=1)
	G =  matrix(.5*L + e1,ncol=1)
	T =  matrix(.3*G + e2,ncol=1)
	T = ifelse( T > median(T), 1, 0 )

	myresults[[ tst ]] = cit.bp(L, G, T, perm.index=perm.index, n.perm=n.perm)
}
fdr.cit( myresults )




