library(RSEIS)


### Name: letter.it
### Title: Add letters to the corners of plots in multiple figures
### Aliases: letter.it
### Keywords: aplot

### ** Examples

par(mfrow=c(2,2))
for(i in 1:4)
{
x  <-  1:10
y  <-  rnorm(10)
plot(x,y)
letter.it(letters[i], 2)

  }



