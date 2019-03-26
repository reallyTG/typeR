library(comparer)


### Name: mbc
### Title: Model benchmark compare
### Aliases: mbc

### ** Examples

# Compare distribution of mean for different sample sizes
mbc(mean(rnorm(1e2)),
    mean(rnorm(1e4)),
    times=20)

# Compare mean and median on same data
mbc(mean(x),
    median(x),
    inputi={x=rexp(1e2)})

# input given, no post
mbc(function(x) {Sys.sleep(rexp(1, 30));mean(x)},
    function(x) {Sys.sleep(rexp(1, 5));median(x)},
    inputi={x=runif(100)})

# input given with post
mbc(function(x) {Sys.sleep(rexp(1, 30));mean(x)},
    function(x) {Sys.sleep(rexp(1, 5));median(x)},
    inputi={x=runif(100)},
    post=function(x){c(x+1, 12)})

# input given with post, 30 times
mbc(function(x) {Sys.sleep(rexp(1, 30));mean(x)+runif(1)},
    function(x) {Sys.sleep(rexp(1, 50));median(x)+runif(1)},
    inputi={runif(100)},
    post=function(x){c(x+1, 12)}, times=10)

# Name one function and post
mbc(function(x) {mean(x)+runif(1)},
    a1=function(x) {median(x)+runif(1)},
    inputi={x=runif(100)},
    post=function(x){c(rr=x+1, gg=12)}, times=10)

# No input
m1 <- mbc(function() {x <- runif(100);Sys.sleep(rexp(1, 30));mean(x)},
          function() {x <- runif(100);Sys.sleep(rexp(1, 50));median(x)})



