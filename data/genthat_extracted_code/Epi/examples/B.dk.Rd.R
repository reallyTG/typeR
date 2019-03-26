library(Epi)


### Name: B.dk
### Title: Births in Denmark by year and month of birth and sex
### Aliases: B.dk
### Keywords: datasets

### ** Examples

data( B.dk )
str( B.dk )
attach( B.dk )
# Plot the no of births and the M/F-ratio
par( las=1, mar=c(4,4,2,4) )
matplot( year+(month-0.5)/12,
         cbind( m, f ),
         bty="n", col=c("blue","red"), lty=1, lwd=1, type="l",
         ylim=c(0,5000),
         xlab="Date of birth", ylab="" )
usr <- par()$usr
mtext( "Monthly no. births in Denmark", side=3, adj=0, at=usr[1], line=1/1.6 )
text( usr[1:2] %*% cbind(c(19,1),c(19,1))/20,
      usr[3:4] %*% cbind(c(1,19),c(2,18))/20, c("Boys","Girls"), col=c("blue","red"), adj=0 ) 
lines( year+(month-0.5)/12, (m/(m+f)-0.5)*30000, lwd=1 )
axis( side=4, at=(seq(0.505,0.525,0.005)-0.5)*30000, labels=c("","","","",""), tcl=-0.3 )
axis( side=4, at=(50:53/100-0.5)*30000, labels=50:53, tcl=-0.5 )
axis( side=4, at=(0.54-0.5)*30000, labels="% boys", tick=FALSE, mgp=c(3,0.1,0) )
abline( v=1920, col=gray(0.8) )



