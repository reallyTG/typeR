library(data.table)


### Name: chmatch
### Title: Faster match of character vectors
### Aliases: chmatch %chin% chorder chgroup
### Keywords: data

### ** Examples

# Please type 'example(chmatch)' to run this and see timings on your machine

N = 1e5
# N is set small here (1e5) to reduce runtime because every day CRAN runs and checks
# all documentation examples in addition to the package's test suite.
# The comments here apply when N has been changed to 1e8 and were run on 2018-05-13
# with R 3.5.0 and data.table 1.11.2.

u = as.character(as.hexmode(1:10000))
y = sample(u,N,replace=TRUE)
x = sample(u)
                                           #  With N=1e8 ...
system.time(a <- match(x,y))               #  4.6s
system.time(b <- chmatch(x,y))             #  1.8s
identical(a,b)

system.time(a <- x %in% y)               #  4.5s
system.time(b <- x %chin% y)             #  1.7s
identical(a,b)

# Different example with more unique strings ...
u = as.character(as.hexmode(1:(N/10)))
y = sample(u,N,replace=TRUE)
x = sample(u,N,replace=TRUE)
system.time(a <- match(x,y))               # 46s
system.time(b <- chmatch(x,y))             # 16s
identical(a,b)



