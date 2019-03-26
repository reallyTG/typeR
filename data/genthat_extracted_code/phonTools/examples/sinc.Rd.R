library(phonTools)


### Name: sinc
### Title: Sinc Function
### Aliases: sinc

### ** Examples

x = seq(-20,20,.1)
## generate both forms of the sinc function between -20 and 20
y1 = sinc (x)
y2 = sinc (x, normalized = TRUE)
## the unnormalized sinc function has zero crossing at 
## integer multiples of pi
plot (x,y1, type = 'b')
## the normalized sinc function has zero crossing at integers
lines (x,y2, type = 'b', col = 4)
abline (h = 0)



