library(OpasnetUtils)


### Name: objects
### Title: Server side shared R objects
### Aliases: objects objects.decode objects.encode objects.get
###   objects.latest objects.put objects.store

### ** Examples


# Within Opasnet only! Let's assume that the (en.opasnet.org) page identifier - 
# where to code is - would be "Op_en1390" and code name "objs_save_test".
x <- stats::runif(20)
y <- list(a = 1, b = TRUE, c = "Jeah baby jeah!")
## Not run: 
##D objects.store(x, y)
## End(Not run)
# Fetching can be done also from local R installation.
## Not run: 
##D objects.latest("Op_en1390","objs_save_test")
## End(Not run)
print(x)
print(y)

# Object encrypt and decrypt

key <- "1234567890abcdef"

eobj <- objects.encode(y, key)
print(eobj)
obj <- objects.decode(eobj, key)
print(obj)



