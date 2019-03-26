library(hyper2)


### Name: change_pnames
### Title: Change pnames of a hyper2 object
### Aliases: change_pnames all_pnames

### ** Examples


x1 <- hyper2(list(1,1:2,1:3),1:3,pnames=letters[1:3])
x2 <- x1
pnames(x2) <- letters[3:1]

x1
x2
# At this point, note that x1 and x2 are algebraically identical; but:
x1==x2

## Variables x1 and x2 are different!  This is by design. The pnames
## attribute is just syntatic sugar, mathematically meaningless.

## Also note that you cannot add x1 and x2 because to do so is bad weirdness:
## Not run: 
##D x1 + x2
## End(Not run)

## Here is a sensible use-case:

x1 <- hyper2(list(1,1:2,1:3),1:3,pnames=letters[1:3])
x2 <- hyper2(list(1,2),10:11,pnames=letters[4:5])

pnames(x1) <- letters[1:5]
pnames(x2) <- letters[1:5]
x1+x2


## NB:

pnames(x1) <- letters[5:1]
x1





