library(spray)


### Name: spray
### Title: Create sparse array objects
### Aliases: spray as.spray is.spray spraymaker is_valid_spray index value
###   value<-
### Keywords: symbolmath

### ** Examples


S <- spray(diag(5))    # missing second argument interpreted as '1'.
as.array(S,offbyone=TRUE) # zero indices interpreted as ones.

M <- matrix(1:5,6,5) # note first row matches the sixth row

## Not run:  spray(M,1:6)  # will not work because addrepeats is not TRUE


spray(M,1:6,addrepeats=TRUE)  # 7=1:6 


S <- spray(matrix(1:7,5,7))
a <- as.array(S)    # will not work if any(M<1)
S1 <- as.spray(a)
stopifnot(S==S1)



