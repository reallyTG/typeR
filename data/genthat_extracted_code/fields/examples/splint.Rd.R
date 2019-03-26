library(fields)


### Name: splint
### Title: Cubic spline interpolation
### Aliases: splint
### Keywords: smooth

### ** Examples

x<- seq( 0, 120,,200)

# an interpolation
splint(rat.diet$t, rat.diet$trt,x )-> y

plot( rat.diet$t, rat.diet$trt)
lines( x,y)
#( this is weird and not appropriate!)

# the following two smooths should be the same

splint( rat.diet$t, rat.diet$con,x, df= 7)-> y1

# sreg function has more flexibility than splint but will
# be slower for larger data sets. 

sreg( rat.diet$t, rat.diet$con, df= 7)-> obj
predict(obj, x)-> y2 

# in fact predict.sreg interpolates the predicted values using splint!

# the two predicted lines (should) coincide
lines( x,y1, col="red",lwd=2)
lines(x,y2, col="blue", lty=2,lwd=2)
 



