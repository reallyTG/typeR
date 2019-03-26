library(InfDim)


### Name: adjust
### Title: A generic function to scale the values of a vector between -1
###   and 1. This function is a subfunction of 'IDM'.
### Aliases: adjust

### ** Examples

# The function is currently defined as
function(age){
u=-1
v=1
n=length(age)
amin=min(age)
amax=max(age)

temp=u+(v-u)/(amax-amin)*(age-amin)
return(temp)
  }



