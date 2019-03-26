library(nbpMatching)


### Name: gendistance
### Title: Generate a Distance Matrix
### Aliases: gendistance gendistance,data.frame-method

### ** Examples


set.seed(1)
df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
# add some missing data
df[sample(seq_len(nrow(df)), ceiling(nrow(df)*0.1)), 2] <- NA
df.dist <- gendistance(df, idcol=1, ndiscard=2)
# up-weight the second column
df.weighted <- gendistance(df, idcol=1, weights=c(1,2,1), ndiscard=2, missing.weight=0.25)
df[,3] <- df[,2]*2
df.sing.solve <- gendistance(df, idcol=1, ndiscard=2)
df.sing.ginv <- gendistance(df, idcol=1, ndiscard=2, singular.method="ginv")




