library(m2r)


### Name: m2_path
### Title: Set path to Macaulay2 (M2)
### Aliases: m2_path set_m2_path get_m2_path get_m2_con get_m2_procid
###   get_m2_port

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D 
##D getOption("m2r")
##D get_m2_path()
##D set_m2_path()
##D 
##D 
##D ## each of these functions can be used statically as well
##D (m2_path <- get_m2_path())
##D set_m2_path("/path/to/m2/directory")
##D get_m2_path()
##D set_m2_path(m2_path) # undoes example
##D 
##D 
##D # if you'd like to use the cloud, after you library(m2r)
##D # and before you use m2() type
##D set_m2_path(NULL)
##D 
##D # alternatively, if you have already been using m2, do:
##D stop_m2()
##D set_m2_path(NULL)
##D m2("1+1")
##D 
##D 
## End(Not run)



