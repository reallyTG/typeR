context("Moments_M3")

# (Slower, but trusted) R version of Moments_M3
.Moments_M3_R = function(X,Y)
{
	library(tensor)
	n = nrow(X)
	d = ncol(X)
	v = rep(0,d)
	e = diag(rep(1,d))

	M31=M3_1=M3_2=M3_3 = tensor(tensor(v,v),v)
	for (i in 1:n)
		M31 = M31 + (Y[i]*tensor(tensor(X[i,],X[i,]),X[i,]))
	M31 = (1/n)*M31

	for(j in 1:d)
	{
		l1=l2=l3 = tensor(tensor(v,v),v)
		for(i in 1:n)
		{
			l1 = l1 + Y[i]*tensor(tensor(e[,j],X[i,]),e[,j])
			l2 = l2 + Y[i]*tensor(tensor(e[,j],e[,j]),X[i,])
			l3 = l3 + Y[i]*tensor(tensor(X[i,],e[,j]),e[,j])
		}
		l1 = (1/n)*l1
		l2 = (1/n)*l2
		l3 = (1/n)*l3
		M3_1 = M3_1+l1
		M3_2 = M3_2+l2
		M3_3 = M3_3+l3
	}

	M3 = M31-(M3_1+M3_2+M3_3)
	return (M3)
}

test_that("both versions of Moments_M3 agree on various inputs",
{
	for (n in c(20,200))
	{
		for (d in c(2,10,20))
		{
			X = matrix( runif(n*d,min=-1,max=1), nrow=n )
			Y = runif(n,min=-1,max=1)
			M3 = .Moments_M3(X,Y)
			M3_R = .Moments_M3_R(X,Y)
			expect_equal(max(abs(M3 - M3_R)), 0)
		}
	}
})
