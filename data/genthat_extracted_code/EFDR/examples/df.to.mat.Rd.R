library(EFDR)


### Name: df.to.mat
### Title: Change xyz data-frame into a Z image
### Aliases: df.to.mat
### Keywords: image reshape,

### ** Examples

df <- data.frame(expand.grid(1:10,1:10))
names(df) <- c("x","y")
df$z <- rnorm(nrow(df))
Z <- df.to.mat(df)



