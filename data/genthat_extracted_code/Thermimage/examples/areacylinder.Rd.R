library(Thermimage)


### Name: areacylinder
### Title: Provides the surface area of a cylinder.
### Aliases: areacylinder

### ** Examples

## The function is currently defined as
function(Radius, radius=Radius, height, ends=2)
{
  Area <- (Radius+radius)*pi*height + ends*pi*Radius*radius
  Area
  }

# Example calculation:

# Typically, a body part might be modelled as cylindrical if it appears to be approximately
# circular or elliptical and elongated.  By measuring the major diameter (D) and minor
# diameter (d) as well as the length or height (l), the overall surface area can be 
# determined:

D<-12
d<-6
l<-18
areacylinder(Radius=D/2, radius=d/2, height=l, ends=2)


# To only show surface area of the exposed surface, and exclude the oval base of the 
# cylinder, set ends=0

areacylinder(Radius=D/2, radius=d/2, height=l, ends=0)





