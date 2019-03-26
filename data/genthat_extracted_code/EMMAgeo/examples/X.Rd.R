library(EMMAgeo)


### Name: X
### Title: example data
### Aliases: X
### Keywords: datasets

### ** Examples

## load example data set
data(X)

## extract grain-size classes
s <- as.numeric(colnames(X))

## plot first 10 samples stacked in one line plot
plot(NA,
     xlim = c(1, ncol(X)),
     ylim = c(1, 20))

for(i in 1:10) {
  lines(x = s,
        y = X[i,] + i)
}

## plot grain-size map
image(x = s,
      z = t(X),
      log = "x",
      col = rainbow(n = 250))



