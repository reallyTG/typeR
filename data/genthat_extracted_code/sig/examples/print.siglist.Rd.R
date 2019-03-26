library(sig)


### Name: toString.siglist
### Title: Print a siglist object
### Aliases: print.siglist toString.siglist

### ** Examples

method_sigs <- list_sigs(pkg2env(methods))
print(method_sigs)
print(method_sigs, width = 40)
print(method_sigs, width = 40, exdent = 2)
toString(method_sigs)



