library(RMAWGEN)


### Name: GPCA
### Title: This function makes a Gaussianization procedure based on PCA
###   iteration ( see 'GPCA_iteration')
### Aliases: GPCA

### ** Examples

library(RMAWGEN)
set.seed(1222)
nIterations <- 30
N <- 20
x <- rexp(N)
y <- x+rnorm(N)
df <- data.frame(x=x,y=y)

GPCA <- GPCA(df,n=nIterations,extremes=TRUE)

x <- rnorm(N)
y <- x+rnorm(N)
dfn <- data.frame(x=x,y=y)

GPCAn <- GPCA(dfn,n=nIterations,extremes=TRUE)





