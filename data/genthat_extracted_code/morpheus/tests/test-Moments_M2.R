context("Moments_M2")

# (Slower, but trusted) R version of Moments_M2
.Moments_M2_R = function(X,Y)
{
	library(tensor)
	n = nrow(X)
	d = ncol(X)
	v = rep(0,d)
	e = diag(rep(1,d))

	M21 = M2_1 = tensor(v,v)
	for (i in 1:n)
		M21 = M21 + Y[i] * tensor(X[i,],X[i,])
	M21 = (1/n) * M21

	for (j in 1:d)
	{
		L = tensor(v,v)
		for (i in 1:n)
			L = L + Y[i]*tensor(e[,j],e[,j])
		L = (1/n) * L
		M2_1 = M2_1 + L
	}

	M2 = M21 - M2_1
	return (M2)
}

test_that("both versions of Moments_M2 agree on various inputs",
{
	for (n in c(20,200))
	{
		for (d in c(2,10,20))
		{
			X = matrix( runif(n*d,min=-1,max=1), nrow=n )
			Y = runif(n,min=-1,max=1)
			M2 = .Moments_M2(X,Y)
			M2_R = .Moments_M2_R(X,Y)
			expect_equal(max(abs(M2 - M2_R)), 0)
		}
	}
})
