library(Thermimage)


### Name: areacone
### Title: Provides the surface are of a cone
### Aliases: areacone

### ** Examples


## The function is currently defined as
function(Radius, radius=Radius, hypotenuse=NULL, height, ends=1)
{
  if(is.null(hypotenuse)){
    hypotenuse<-sqrt(height^2+Radius^2)
  }
  Area <- ends*pi*Radius*radius + pi*Radius*hypotenuse
  Area
}

# Example calculation from a measure of a bird bill.

# Typically, a bird bill will be measured by its depth (d) at the base, its width (w) at the 
# base and by its overall length.  The length (l) is typically measured along the length of
# the culmen, and thus is a diagonal measure along the hypotenuse of the cone.

d<-12
w<-6
l<-18
areacone(Radius=d/2, radius=w/2, hypotenuse=l, height=NULL, ends=1)


# If the perpendicular cone height (h) is instead measured, rather than the hypotenuse, then
# substitute h for height and assign hypotenuse = NULL, to obtain the same result

h<-sqrt(l^2-(d/2)^2)
areacone(Radius=d/2, radius=w/2, hypotenuse=NULL, height=h, ends=1)


# To only show surface area of the exposed surface, and exclude the oval base of the cone
# set ends=0:

areacone(Radius=d/2, radius=w/2, hypotenuse=l/2, height=NULL, ends=0)




