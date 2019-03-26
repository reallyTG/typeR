library(ifultools)


### Name: splitplot
### Title: Partitions plot space into rectangular grid
### Aliases: splitplot
### Keywords: hplot

### ** Examples

## establish a 2x2 plot grid and select the first 
## for plotting 
old.plt <- splitplot(2,2,1)

## plot the data 
for (i in seq(4)){
    if (i > 1)
       splitplot(2,2,i)

    plot(rnorm(100)*i)
    mtext(paste("i=", i, sep=""), side=3, line=0.5)
}

## return the original plot state of plt in par 
par(old.plt)



