library(openssl)


### Name: rand_bytes
### Title: Generate random bytes and numbers with OpenSSL
### Aliases: rand_bytes rand_num

### ** Examples

rnd <- rand_bytes(10)
as.numeric(rnd)
as.character(rnd)
as.logical(rawToBits(rnd))

# bytes range from 0 to 255
rnd <- rand_bytes(100000)
hist(as.numeric(rnd), breaks=-1:255)

# Generate random doubles between 0 and 1
rand_num(5)

# Use CDF to map [0,1] into random draws from a distribution
x <- qnorm(rand_num(1000), mean=100, sd=15)
hist(x)

y <- qbinom(rand_num(1000), size=10, prob=0.3)
hist(y)



