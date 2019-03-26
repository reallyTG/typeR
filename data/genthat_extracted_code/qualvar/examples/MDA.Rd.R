library(qualvar)


### Name: MDA
### Title: Mean Difference Analog (MDA or MNDIF)
### Aliases: MDA

### ** Examples

x <- rmultinom(1, 100, rep_len(0.25, 4))
x <- as.vector(t(x))
MDA(x)

df <- rmultinom(10, 100, rep_len(0.25, 4))
df <- as.data.frame(t(df))
apply(df, 1, MDA)



