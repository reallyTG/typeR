library(wrapr)


### Name: mk_tmp_name_source
### Title: Produce a temp name generator with a given prefix.
### Aliases: mk_tmp_name_source

### ** Examples


f <- mk_tmp_name_source('ex')
print(f())
nm2 <- f()
print(nm2)
f(remove=nm2)
print(f(dumpList=TRUE))




