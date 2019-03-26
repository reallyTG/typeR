
library("slam")
set.seed(201008)

## test
x <- matrix(sample(c(0,1), 100L, TRUE, prob = c(.9,.1)), 5L)
dim(x)
INDEX <- sample(1:4, 20L, TRUE)

s <- as.simple_triplet_matrix(x)
z <- as.matrix(s)

rollup(z, 2L, rep(1L, 20L), fivenum)

identical(rollup(z, 2L, INDEX), 
	  as.matrix(rollup(s, 2L, INDEX)))
identical(rollup(t(z), 1L, INDEX), 
	  as.matrix(rollup(t(s), 1L, INDEX)))

## NA indexes
k <- INDEX
is.na(k) <- k == 1L
any(is.na(k))
identical(as.matrix(rollup(s, 2L, k)), 
	  rollup(z, 2L, k))

## other data types
s$v <- as.integer(s$v)

identical(rollup(z, 2L, INDEX), 
	  as.matrix(rollup(s, 2L, INDEX)))
##
local({
    s$v <- as.complex(s$v)
    z   <- as.matrix(s)
    identical(rollup(z, 2L, INDEX), 
	      as.matrix(rollup(s, 2L, INDEX)))
})

## NA values
is.na(s$v) <- 1:2
z   <- as.matrix(s)
z[] <- as.double(z) # coerce

identical(rollup(z, 2L, INDEX), 
	  as.matrix(rollup(s, 2L, INDEX)))
identical(rollup(z, 2L, INDEX, na.rm = TRUE), 
	  as.matrix(rollup(s, 2L, INDEX, na.rm = TRUE)))

##
s$v <- as.double(s$v)

identical(rollup(z, 2L, INDEX, na.rm = TRUE), 
	  as.matrix(rollup(s, 2L, INDEX, na.rm = TRUE)))

##
local({
    s$v <- as.complex(s$v)
    z   <- as.matrix(s)
    identical(rollup(z, 2L, INDEX, na.rm = TRUE), 
	      as.matrix(rollup(s, 2L, INDEX, na.rm = TRUE)))
})

##
s <- as.simple_sparse_array(s)
z <- as.array(z)

identical(rollup(z, 2L, INDEX, na.rm = TRUE),
	  as.array(rollup(s, 2L, INDEX, na.rm = TRUE)))

##
INDEX <- rep(1, dim(x)[2L])

identical(rollup(z, 2L, INDEX, na.rm = TRUE),
	  as.array(rollup(s, 2L, INDEX, na.rm = TRUE)))

s <- as.simple_triplet_matrix(s)
identical(rollup(z, 2L, INDEX, na.rm = TRUE),
	  as.array(rollup(s, 2L, INDEX, na.rm = TRUE)))

## reduce
is.na(s$v) <- s$i == 1L

z <- rollup(as.simple_sparse_array(s), 2L, na.rm = TRUE)
z <- reduce_simple_sparse_array(z, order = TRUE)
z <- as.simple_triplet_matrix(z)
identical(z,
	  .Call(slam:::R_row_tsums, s, rep(factor(1L), ncol(s)), 
		TRUE, TRUE, TRUE))

s$v <- as.complex(s$v)

z <- rollup(as.simple_sparse_array(s), 2L, na.rm = TRUE)
z <- reduce_simple_sparse_array(z, order = TRUE)
z <- as.simple_triplet_matrix(z)
identical(z, 
	  rollup(s, 2L, na.rm = TRUE, REDUCE = TRUE))
###
