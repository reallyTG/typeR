library(qualvar)


### Name: DM
### Title: Deviation from the mode (DM)
### Aliases: DM

### ** Examples

x <- rmultinom(1, 100, rep_len(0.25, 4))
x <- as.vector(t(x))
names(x) <- c("a", "b", "c", "d")
DM(x)

df <- rmultinom(10, 100, rep_len(0.25, 4))
df <- as.data.frame(t(df))
names(df) <- c("a", "b", "c", "d")
apply(df, 1, DM)



