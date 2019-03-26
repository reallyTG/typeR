library(nbpMatching)


### Name: fill.missing
### Title: Data Imputation
### Aliases: fill.missing fill.missing,data.frame-method

### ** Examples


set.seed(1)
df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df[sample(seq_len(nrow(df)), ceiling(nrow(df)*0.1)), 2] <- NA
df <- fill.missing(df)




