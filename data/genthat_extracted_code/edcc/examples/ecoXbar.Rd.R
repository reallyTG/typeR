library(edcc)


### Name: ecoXbar
### Title: Economic design for the X-bar control chart
### Aliases: echXbar ecoXbar

### ** Examples

# Douglas (2009). Statistical quality control: a modern introduction, sixth edition, p470.
# In control profit per hour is 110, out of control profit per hour is 10
ecoXbar(P0=110,P1=10)
# In control profit per hour is 150, out of control profit per hour
# is 50, the result is identical with the previous one, because the
#difference between P0 and P1 are the same
ecoXbar(P0=150,P1=50)
# In control cost per hour is 0, out of control cost per hour is 100.
# The result is the same with the previous one
ecoXbar(C0=0,C1=100)
# The optimum parameters are the same with the previous one,
# but Cost values are different. See 'details'
ecoXbar(C0=10,C1=110)
# Based on the global optimum above, we specify the range of the
# parameters like this
x <- ecoXbar(h=seq(0.7,0.9,by=.01),L=seq(2.8,3.3,by=.01),n=4:6,P0=110,
P1=10,nlevels=50,contour.plot=TRUE)
x
# Modify the contour plot
contour(x,nlevels=20,lty=2,col=2,call.print=FALSE)
# update the parameters
update(x,P0=NULL,P1=NULL,C0=10,C1=110)



