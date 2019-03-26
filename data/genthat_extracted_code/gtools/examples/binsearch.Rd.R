library(gtools)


### Name: binsearch
### Title: Binary Search
### Aliases: binsearch
### Keywords: optimize programming

### ** Examples


### Toy examples

# search for x=10
binsearch( function(x) x-10, range=c(0,20) )

# search for x=10.1
binsearch( function(x) x-10.1, range=c(0,20) )

### Classical toy example

# binary search for the index of 'M' among the sorted letters
fun <- function(X) ifelse(LETTERS[X] > 'M', 1,
                          ifelse(LETTERS[X] < 'M', -1, 0 ) )

binsearch( fun, range=1:26 ) 
# returns $where=13
LETTERS[13]

### Substantive example, from genetics
## Not run: 
##D library(genetics)
##D # Determine the necessary sample size to detect all alleles with
##D # frequency 0.07 or greater with probability 0.95.
##D power.fun <- function(N) 1 - gregorius(N=N, freq=0.07)$missprob
##D 
##D binsearch( power.fun, range=c(0,100), target=0.95 )
##D 
##D # equivalent to
##D gregorius( freq=0.07, missprob=0.05)
## End(Not run)



