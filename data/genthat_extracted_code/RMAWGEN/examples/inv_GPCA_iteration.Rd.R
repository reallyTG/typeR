library(RMAWGEN)


### Name: inv_GPCA_iteration
### Title: This function makes an inverse iteration of PCA-Gaussianization
###   process
### Aliases: inv_GPCA_iteration

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

df_out <- inv_GPCA_iteration(GPCA_iter_param=GPCA,extremes=TRUE)
dfn_out <- inv_GPCA_iteration(GPCA_iter_param=GPCAn,extremes=TRUE)





