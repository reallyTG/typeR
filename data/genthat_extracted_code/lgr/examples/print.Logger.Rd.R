library(lgr)


### Name: print.Logger
### Title: Print a Logger Object
### Aliases: print.Logger format.Logger print.ancestry format.ancestry

### ** Examples

# print most important details of logger
print(lgr)

# print only the ancestry of a logger
l1 <- Logger$new("AegonV")
l2 <- Logger$new("Aerys", parent = l1)
l3 <- Logger$new("Rheagar", parent = l2, propagate = FALSE)
l4 <- Logger$new("Aegon", parent = l3)

print(l4$ancestry)
unclass(l4$ancestry)



