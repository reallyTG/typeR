library(qualvar)


### Name: ADA
### Title: Average Deviation Analog (ADA)
### Aliases: ADA

### ** Examples

x <- rmultinom(1, 100, rep_len(0.25, 4))
x <- as.vector(t(x))
ADA(x)

df <- rmultinom(10, 100, rep_len(0.25, 4))
df <- as.data.frame(t(df))
apply(df, 1, ADA)



