library(float)


### Name: arithmetic
### Title: arithmetic
### Aliases: arithmetic +,float32,float32-method *,float32,float32-method
###   -,float32,float32-method /,float32,float32-method
###   ^,float32,float32-method +,float32,BaseLinAlg-method
###   *,float32,BaseLinAlg-method -,float32,BaseLinAlg-method
###   /,float32,BaseLinAlg-method ^,float32,BaseLinAlg-method
###   +,BaseLinAlg,float32-method *,BaseLinAlg,float32-method
###   -,BaseLinAlg,float32-method /,BaseLinAlg,float32-method
###   ^,BaseLinAlg,float32-method <,float32,float32-method
###   <=,float32,float32-method ==,float32,float32-method
###   >,float32,float32-method >=,float32,float32-method
###   <,float32,BaseLinAlg-method <=,float32,BaseLinAlg-method
###   ==,float32,BaseLinAlg-method >,float32,BaseLinAlg-method
###   >=,float32,BaseLinAlg-method <,BaseLinAlg,float32-method
###   <=,BaseLinAlg,float32-method ==,BaseLinAlg,float32-method
###   >,BaseLinAlg,float32-method >=,BaseLinAlg,float32-method

### ** Examples

library(float)

s1 = flrunif(5, 5)
s2 = flrunif(5, 5)
x = matrix(1:25, 5)

s1 + s2 # float

typeof(x) # integer
x + s2 # float

storage.mode(x) = "double"
x + s2 # double




