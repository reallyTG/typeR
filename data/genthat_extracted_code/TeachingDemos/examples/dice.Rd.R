library(TeachingDemos)


### Name: dice
### Title: Simulate rolling dice
### Aliases: dice plot.dice panel.dice prepanel.dice
### Keywords: distribution hplot datagen

### ** Examples


# 10 rolls of 4 fair dice
dice(10,4, plot.it=TRUE)

# or

plot(dice(10,4))

# or

tmp <- dice(10,4)
plot(tmp)

# a loaded die
table(tmp <- dice(100,1,plot.it=TRUE, load=6:1 ) )
colMeans(tmp)

# Efron's dice
ed <- list( rep( c(4,0), c(4,2) ),
  rep(3,6), rep( c(6,2), c(2,4) ),
  rep( c(5,1), c(3,3) ) )

tmp <- dice( 10000, ndice=4 )
ed.out <- sapply(1:4, function(i) ed[[i]][ tmp[[i]] ] )

mean(ed.out[,1] > ed.out[,2])
mean(ed.out[,2] > ed.out[,3])
mean(ed.out[,3] > ed.out[,4])
mean(ed.out[,4] > ed.out[,1])


## redo De Mere's question

demere1 <- dice(10000,4)
demere2 <- dice(10000,24,sides=36)

mean(apply( demere1, 1, function(x) 6 %in% x ))

mean(apply( demere2, 1, function(x) 36 %in% x))

plot(demere1[1:10,])

## plot all possible combinations of 2 dice

plot.dice( expand.grid(1:6,1:6), layout=c(6,6) )



