library(CLME)


### Name: w.stat
### Title: Williams' Type Test Statistic.
### Aliases: w.stat w.stat.ind

### ** Examples

theta  <- exp(1:4/4)
th.cov <- diag(4)
X1     <- matrix( 0 , nrow=1 , ncol=4 )
const  <- create.constraints( P1=4 , constraints=list(order='simple' ,
                                                    decreasing=FALSE) )

w.stat( theta , th.cov , const$B , const$A )

w.stat.ind( theta , th.cov , const$B , const$A )




