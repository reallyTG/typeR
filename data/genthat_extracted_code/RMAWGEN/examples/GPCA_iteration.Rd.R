library(RMAWGEN)


### Name: GPCA_iteration
### Title: This function makes an iteration of PCA-Gaussianization process
### Aliases: GPCA_iteration

### ** Examples

library(RMAWGEN)
set.seed(1222)
N <- 20
x <- rexp(N)
y <- x+rnorm(N)
df <- data.frame(x=x,y=y)

GPCA <- GPCA_iteration(df,extremes=TRUE)

x <- rnorm(N)
y <- x+rnorm(N)
dfn <- data.frame(x=x,y=y)

GPCAn <- GPCA_iteration(dfn,extremes=TRUE)





