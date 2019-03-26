library(h2o)


### Name: aaa
### Title: Starting H2O For examples
### Aliases: aaa

### ** Examples

if(Sys.info()['sysname'] == "Darwin" && Sys.info()['release'] == '13.4.0'){
 quit(save="no")
}else{
 h2o.init(nthreads = 2)
}



