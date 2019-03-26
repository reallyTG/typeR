library(qdap)


### Name: qcv
### Title: Quick Character Vector
### Aliases: qcv
### Keywords: character

### ** Examples

## Not run: 
##D qcv(I, like, dogs)
##D qcv(terms = "I, like, dogs") #default separator is " "
##D qcv(terms = "I, like, dogs", split = ",")
##D qcv(terms = "I  like dogs")
##D qcv(I, like, dogs, space.wrap = TRUE)
##D qcv(I, like, dogs, trailing = TRUE)
##D qcv(I, like, dogs, leading = TRUE)
##D exclude(Top25Words, qcv(the, of, and))
##D qcv(terms = "mpg cyl  disp  hp drat    wt  qsec vs am gear carb")
## End(Not run)



