library(magic)


### Name: cilleruelo
### Title: A class of multiplicative magic squares due to Cilleruelo and
###   Luca
### Aliases: cilleruelo

### ** Examples

is.magic(cilleruelo(5,6))
is.magic(cilleruelo(5,6),func=prod)


f <- function(n){
  jj <-
    sapply(
           seq(from=5,len=n),
           function(i){cilleruelo(i,i-4)}
           )
  xM <- apply(jj,2,max)
  xm <- apply(jj,2,min)

  cbind(xM-xm , 5^(5/12)*xm^0.5 , 6*xm^0.5)
}
  
matplot(f(200),type='l',log='xy',xlab='n',ylab='')
legend(x="topleft",legend=c("xM-xm","5^(5/12).xm^(1/2)","6xm^(1/2)"),
       lty=1:3,col=1:3)






