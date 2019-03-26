library(Ecfun)


### Name: qqnorm2s
### Title: Normal Probability Plot with Multiple Lines and Multiple Symbols
### Aliases: qqnorm2s plot.qqnorm2s
### Keywords: plot

### ** Examples

##
## One data.frame
##
tstDF2 <- data.frame(y=1:3, y2=3:5, z2=c(TRUE, TRUE, FALSE),
                    z3=c('tell', 'me', 'why'), z4=c(1, 2.4, 3.69) )
# produce the object and plot it
Qn2 <- qqnorm2s(c('y', 'y2'), 'z2', tstDF2)

# plot the object previously created
plot(Qn2)

# Check the object
qy <- with(tstDF2, qqnorm2(y, z2, type='b'))
qy$col <- 1
qy2 <- with(tstDF2, qqnorm2(y2, z2, type='b'))
qy2$col <- 2
legend. <- list(pch=list(x='right', legend=c('FALSE', 'TRUE'),
                pch=c('FALSE'=4, 'TRUE'= 1)),
                col=list(x='bottomright', legend=c('y', 'y2'),
                lty=1, col=1:2))
Qn2. <- list(y=qy, y2=qy2, legend.=legend.)
class(Qn2.) <- 'qqnorm2s'

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Qn2, Qn2.)
## Don't show: 
)
## End(Don't show)
##
## Two data.frames
##
tstDF2b <- tstDF2
tstDF2b$y <- c(0.1, 0.1, 9)
Qn2b <- qqnorm2s('y', 'z2', list(tstDF2, tstDF2b),
           outnames=c('ok', 'oops'), log='x' )




