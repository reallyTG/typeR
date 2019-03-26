library(expss)


### Name: ref
### Title: Auxiliary functions to pass arguments to function by reference
### Aliases: ref ref<-

### ** Examples

# Simple example
a = 1:3
b = ~a  # b is reference to 'a'
identical(ref(b),a) # TRUE

ref(b)[2] = 4 # here we modify 'a'
identical(a, c(1,4,3)) # TRUE

# usage inside function

# top 10 rows 
head10 = function(x){
 ds = head(ref(x), 10)
 ref(x) = ds
 invisible(ds) # for usage without references
}

data(iris)
ref_to_iris = ~iris
head10(ref_to_iris) # side-effect
nrow(iris) # 10

# argument is not formula - no side-effect 
data(mtcars)
mtcars10 = head10(mtcars)

nrow(mtcars10) # 10
nrow(mtcars) # 32




