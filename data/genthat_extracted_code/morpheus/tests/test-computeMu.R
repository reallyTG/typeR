context("computeMu")

test_that("on input of sufficient size, beta/||beta|| is estimated accurately enough",
{
	n = 100000
	d = 2
	K = 2
	p = 1/2

	betas_ref = array( c(1,0,0,1 , 1,-2,3,1), dim=c(d,K,2) )
	for (i in 1:(dim(betas_ref)[3]))
	{
		mu_ref = normalize(betas_ref[,,i])
		for (model in c("logit","probit"))
		{
			cat("\n\n",model," :\n",sep="")

			io = generateSampleIO(n, p, betas_ref[,,i], rep(0,K), model)
			mu = computeMu(io$X, io$Y, list(K=K))
			mu_aligned = alignMatrices(list(mu), ref=mu_ref, ls_mode="exact")[[1]]

			#Some traces: 0 is not well estimated, but others are OK
			cat("Reference normalized matrix:\n")
			print(mu_ref)
			cat("Estimated normalized matrix:\n")
			print(mu_aligned)
			cat("Difference norm (Matrix norm ||.||_1, max. abs. sum on a column)\n")
			diff_norm = norm(mu_ref - mu_aligned)
			cat(diff_norm,"\n")

			#NOTE: 0.5 is loose threshold, but values around 0.3 are expected...
			expect_that( diff_norm, is_less_than(0.5) )
		}
	}
})
