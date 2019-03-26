context("OptimParams")

naive_f = function(link, M1,M2,M3, p,beta,b)
{
	d = length(M1)
	K = length(p)
	lambda <- sqrt(colSums(beta^2))

	# Compute beta x2,3 (self) tensorial products
	beta2 = array(0, dim=c(d,d,K))
	beta3 = array(0, dim=c(d,d,d,K))
	for (k in 1:K)
	{
		for (i in 1:d)
		{
			for (j in 1:d)
			{
				beta2[i,j,k] = beta[i,k]*beta[j,k]
				for (l in 1:d)
					beta3[i,j,l,k] = beta[i,k]*beta[j,k]*beta[l,k]
			}
		}
	}

	res = 0
	for (i in 1:d)
	{
		term = 0
		for (k in 1:K)
			term = term + p[k]*.G(link,1,lambda[k],b[k])*beta[i,k]
		res = res + (term - M1[i])^2
		for (j in 1:d)
		{
			term = 0
			for (k in 1:K)
				term = term + p[k]*.G(link,2,lambda[k],b[k])*beta2[i,j,k]
			res = res + (term - M2[i,j])^2
			for (l in 1:d)
			{
				term = 0
				for (k in 1:K)
					term = term + p[k]*.G(link,3,lambda[k],b[k])*beta3[i,j,l,k]
				res = res + (term - M3[i,j,l])^2
			}
		}
	}
	res
}

test_that("naive computation provides the same result as vectorized computations",
{
	h <- 1e-7 #for finite-difference tests
	tol <- 5e-4 #.25 * sqrt(h) #about 7.9 e-5
	for (dK in list( c(2,2), c(5,3)))
	{
		d = dK[1]
		K = dK[2]

		M1 = runif(d, -1, 1)
		M2 = matrix(runif(d*d,-1,1), ncol=d)
		M3 = array(runif(d*d*d,-1,1), dim=c(d,d,d))

		for (link in c("logit","probit"))
		{
			op = new("OptimParams", "li"=link, "M1"=as.double(M1),
				"M2"=as.double(M2), "M3"=as.double(M3), "K"=as.integer(K))

			for (var in seq_len((2+d)*K-1))
			{
				p = runif(K, 0, 1)
				p = p / sum(p)
				beta <- matrix(runif(d*K,-5,5),ncol=K)
				b = runif(K, -5, 5)
				x <- c(p[1:(K-1)],as.double(beta),b)

				# Test functions values
				expect_equal( op$f(x), naive_f(link,M1,M2,M3, p,beta,b) )

				# Test finite differences ~= gradient values
				dir_h <- rep(0, (2+d)*K-1)
				dir_h[var] = h

				expect_equal( op$grad_f(x)[var], ( op$f(x+dir_h) - op$f(x) ) / h, tol )
			}
		}
	}
})
