library(R.oo)


### Name: ll
### Title: Generates a list of informative properties of all members of an
###   environment
### Aliases: ll.default ll
### Keywords: utilities

### ** Examples

  ## Not run: 
##D    To list all objects in .GlobalEnv:
##D    > ll()
##D    		     member data.class dimension objectSize
##D    1                *tmp*     Person         1         428
##D    2  as.character.Person   function      NULL        1208
##D    3              country  character         1          44
##D    4        equals.Person   function      NULL        2324
##D    5             filename  character         1          84
##D    6               getAge   function      NULL         372
##D    7        getAge.Person   function      NULL         612
##D    8       getName.Person   function      NULL         628
##D    9      hashCode.Person   function      NULL        1196
##D    10        last.warning       list         1         192
##D    11                 obj     Person         1         428
##D    12              Person      Class      NULL        2292
##D    13              setAge   function      NULL         372
##D    14       setAge.Person   function      NULL        2088
##D    15             setName   function      NULL         372
##D    16      setName.Person   function      NULL         760
##D    17   staticCode.Person   function      NULL        2372
##D 
##D    To list all functions in the methods package:
##D    ll(mode="function", envir="methods")
##D 
##D    To list all numeric and character object in the base package:
##D    ll(mode=c("numeric", "character"), envir="base")
##D 
##D    To list all objects in the base package greater than 40kb:
##D    subset(ll(envir="base"), objectSize > 40000)
##D   
## End(Not run)



