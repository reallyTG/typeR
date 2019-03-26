library(mau)


### Name: Stand.String
### Title: Standardize strings
### Aliases: Stand.String

### ** Examples

 x<-c( "H?\u00da\u00e0n with C@1_ad1", 
       "M\u00a1a/\u00ac\u00b0r&\u00eca *_the#-rot", 
       "ju%LI\u00d6 a P\u00e9rs", 
       "(S)tev\n\u00e9n\t los cat%$" )
 y<-sapply( x, FUN = Stand.String )
 names( y )<-NULL



