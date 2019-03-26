library(fractal)


### Name: hurstBlock
### Title: Hurst coefficient estimation in the time domain
### Aliases: hurstBlock
### Keywords: univar models nonlinear

### ** Examples

## create test series 
set.seed(100)
x <- rnorm(1024)
walk <- cumsum(x)
diffwalk <- diff(walk)

## calculate the Hurst coefficient of a random 
## walk series using various techniques 
methods <- c("aggabs","aggvar","diffvar","higuchi")
z <- list(
  "aggabs" = hurstBlock(walk, method = "aggabs"),
  "aggvar" = hurstBlock(walk, method = "aggvar"),
  "diffvar" = hurstBlock(walk, method = "diffvar"),
  "higuchi" = hurstBlock(diffwalk, method = "higuchi"))
  
## plot results 
old.plt <- splitplot(2,2,1)
for (i in 1:4){
    if (i > 1)
       splitplot(2,2,i)
    plot(z[[i]], key=FALSE)
    mtext(paste(attr(z[[i]],"stat.name"), round(as.numeric(z[[i]]),3), sep=", H="),
       line=0.5, adj=1)
}
par(old.plt)



