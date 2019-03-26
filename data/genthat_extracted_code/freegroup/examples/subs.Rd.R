library(freegroup)


### Name: subs
### Title: Substitute and invert symbols
### Aliases: subs flip

### ** Examples


subs(abc(1:10),abc(5),'z')
flip(abc(1:10),abc(5))


o <- rfree(30,5,10)

# Following tests should all be TRUE:
size(flip(o,'a'))   == size(o)
number(flip(o,'a')) == number(o)
total(flip(o,'a'))  == total(o)

size(subs(o,'a','b'))   <= size(o)
number(subs(o,'a','b')) <= number(o)
total(subs(o,'a','b'))  <= total(o)





