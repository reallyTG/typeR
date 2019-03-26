##
library("slam")
##
x <- simple_sparse_zero_array(dim = c(3, 2))

x[1]
x[matrix(c(1, 1), nrow = 1)]

##
x <- as.simple_sparse_array(matrix(1:6, ncol = 2))
x[1]
x[matrix(c(1, 1), nrow = 1)]

x[1.1]				## truncation

x[integer()]
x[matrix(integer(), ncol = 2)]


				## missing values
x[c(1, 0, NA, 2)]

k <- matrix(c(1, 1, 1, 0, 1, NA), ncol = 2, byrow = TRUE)
k
x[k]

try(x[as.logical(k)])		## wrong type
				## wrong dimensions 
dim(k) <- c(2,3)
as.vector(k)
x[k]


z <- x[c(1,3),]
data.frame(v = z$v, i = z$i,
    k = .Call(slam:::R_vector_index, z$dim, z$i))


## drop not implemented
x[ 1,]
x[-1,]
try(x[1, NA_integer_]) 		## not implemented
str(x[0,])
str(x[0, 0])

x[c(1, 8)]			## out of bounds allowed
try(x[1, 8])			## not allowed

dim(k) <- c(3,2)
k[6] <- 3
k
try(x[k])			## not allowed

x[cbind(c(0, 1), c(-1, 0))]	## allowed

##
x <- simple_triplet_zero_matrix(nrow = 3, ncol = 2)

x[1]
x[matrix(c(1, 1), nrow = 1)]

##
x <- as.simple_triplet_matrix(matrix(1:6, ncol = 2))
x[1]
x[matrix(c(1, 1), nrow = 1)]

x[1.1]				## truncation

x[integer()]
x[matrix(integer(), ncol = 2)]


				## missing values
x[c(1, 0, NA, 2)]

k <- matrix(c(1, 1, 1, 0, 1, NA), ncol = 2, byrow = TRUE)
k
x[k]

x[as.logical(k)]		## wrong type
				## wrong dimensions 
dim(k) <- c(2,3)
as.vector(k)
x[k]


z <- x[c(1,3),]
data.frame(v = z$v, i = z$i, j = z$j,
    k = .Call(slam:::R_vector_index, c(z$nrow, z$ncol), cbind(z$i, z$j)))


## drop not implemented
x[ 1,]
x[-1,]
try(x[1, NA_integer_]) 		## not implemented
str(x[0,])
str(x[0, 0])

x[c(1, 8)]			## out of bounds allowed
try(x[1, 8])			## not allowed

dim(k) <- c(3,2)
k[6] <- 3
k
try(x[k])			## not allowed

x[cbind(c(0, 1), c(-1, 0))]	## allowed

x[c(TRUE, FALSE)]
x[c(TRUE, FALSE),]

## reference
x <- matrix(1:6, ncol = 2)
x[c(1, 0, NA, 2)]

try(x[-c(1, NA)])		## not allowed

				## missing allowed
k <- matrix(c(1, 1, 1, 0, 1, NA), ncol = 2, byrow = TRUE)
k
x[k]

dim(k) <- c(2, 3)
as.vector(k)
x[k]


x[ 1,]
x[-1,]
x[ 1, NA]			## wildcard

x[0,]				## does not drop
x[0,0]

x[c(1, 8)]			## out of bounds allowed
try(x[1, 8])			## not allowed

dim(k) <- c(3,2)
k[6] <- 3
k
try(x[k])			## not allowed

x[c(TRUE, FALSE)]
x[c(TRUE, FALSE),]


##
m <- matrix(c(1, 1, 0, 2), nrow = 2)
m
s <- as.simple_triplet_matrix(m)
identical(s[s > 0], m[m > 0])
identical(s[s > 0], s$v)	## not guaranteed
local({
    s[s > 0] <- 3
    m[m > 0] <- 3
    identical(as.matrix(s), m)
})

try(s[s])
a <- as.simple_sparse_array(s)
try(s[a])

is.na(m) <- 2
m
s <- as.simple_triplet_matrix(m)
identical(s[s > 0], m[m > 0])

local({
    s[s > 0] <- 3
    m[m > 0] <- 3
    identical(as.matrix(s), m)
})

###
