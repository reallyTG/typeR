library(dat)


### Name: extract
### Title: Extract elements from a vector
### Aliases: extract extract,list,function-method
###   extract,atomic,function-method extract,ANY,formula-method
###   extract,atomicORlist,numericORintegerORlogical-method
###   extract,ANY,character-method extract,data.frame,character-method
###   extract2 extract2,atomicORlist,numericORinteger-method
###   extract2,ANY,formula-method extract2,atomicORlist,function-method
###   extract2,ANY,character-method

### ** Examples

extract(1:15, ~ 15 %% . == 0)
extract(list(xy = 1, zy = 2), "^z")
extract(list(x = 1, z = 2), 1)
extract(list(x = 1, y = ""), is.character)

# Example: even numbers:
is.even <- function(x) (x %% 2) == 0
sum((1:10)[is.even(1:10)])
extract(1:10, ~ . %% 2 == 0) %>% sum
extract(1:10, is.even) %>% sum

# Example: factors of 15
extract(1:15, ~ 15 %% . == 0)

# Example: relative prime numbers
gcd <- function(a, b) {
  .gcd <- function(a, b) if (b == 0) a else Recall(b, a %% b)
  flatmap(a ~ b, .gcd)
}

extract(1:10, x ~ gcd(x, 10) == 1)

# Example: real prime numbers
isPrime <- function(n) {
  .isPrime <- function(n) {
    iter <- function(i) {
      if (i * i > n) TRUE
      else if (n %% i == 0 || n %% (i + 2) == 0) FALSE
      else Recall(i + 6)
    }
    if (n <= 1) FALSE
    else if (n <= 3) TRUE
    else if (n %% 2 == 0 || n %% 3 == 0) FALSE
    else iter(5)
  }
  flatmap(n, x ~ .isPrime(x))
}

extract(1:10, isPrime)



