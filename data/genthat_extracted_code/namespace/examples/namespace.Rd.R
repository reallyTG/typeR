library(namespace)


### Name: namespace
### Title: Create, register, obtain a reference to, and unregister
###   namespaces
### Aliases: registerNamespace unregisterNamespace makeNamespace
###   getRegisteredNamespace
### Keywords: programming

### ** Examples


## Get a reference to the namespace for the 'base' package
getRegisteredNamespace("base")

## Create a namespace, and stuff something into it.
ns <- makeNamespace("myNamespace")
assign("test",7, env=ns)
ls(env=ns)

## Now grab a reference to the namespace we just defined
ns2 <- getNamespace("myNamespace")

## Don't show: 
stopifnot(identical(ns, ns2))
## End(Don't show)

## Now unregister the namespace
unregisterNamespace("myNamespace")

## Returns NULL if it is no longer defined
getRegisteredNamespace("myNamespace")
## Don't show: 
   stopifnot( is.null(getRegisteredNamespace("::no such package::")) )
## End(Don't show)




