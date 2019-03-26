library(reshape)


### Name: add.all.combinations
### Title: Add all combinations
### Aliases: add.all.combinations
### Keywords: internal

### ** Examples
rdunif <- 
function(n=20, min=0, max=10) floor(runif(n,min, max))
df <- data.frame(a = rdunif(), b = rdunif(),c = rdunif(), result=1:20)
add.all.combinations(df)
add.all.combinations(df, list("a", "b"))
add.all.combinations(df, list("a", "b"), fill=0)
add.all.combinations(df, list(c("a", "b")))
add.all.combinations(df, list("a", "b", "c"))
add.all.combinations(df, list(c("a", "b"), "c"))
add.all.combinations(df, list(c("a", "b", "c")))


