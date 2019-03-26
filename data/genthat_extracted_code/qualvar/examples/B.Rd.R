library(qualvar)


### Name: B
### Title: B (modified geometric mean)
### Aliases: B

### ** Examples

x <- rmultinom(1, 100, rep_len(0.25, 4))
x <- as.vector(t(x))
B(x)

df <- rmultinom(10, 100, rep_len(0.25, 4))
df <- as.data.frame(t(df))
apply(df, 1, B)



