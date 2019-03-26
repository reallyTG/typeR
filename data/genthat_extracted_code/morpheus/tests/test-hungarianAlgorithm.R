context("hungarianAlgorithm")

test_that("HungarianAlgorithm provides the correct answer on various inputs",
{
	for (n in c(2,3,10,50))
	{
		for (repetition in 1:3)
		{
			# Generate a random vector, and permute it:
			# we expect the algorithm to retrieve the permutation
			v = runif(n, min=-1, max=1)
			permutation = sample(1:n)
			v_p = v[permutation]

			# v is reference, v_p is v after permutation
			# distances[i,j] = distance between i-th component of v and j-th component of v_p
			# "in rows : reference; in columns: after permutation"
			# "permutation" contains order on v to match v_p as closely as possible
			distances = sapply(v_p, function(elt) ( abs(elt - v) ) )
			assignment = .hungarianAlgorithm(distances)
			expect_equal(assignment, permutation)
		}
	}
})
