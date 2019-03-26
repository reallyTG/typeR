library(MOLHD)


### Name: Mm
### Title: Computer the approximate Maximin Criterion for a design.
### Aliases: Mm
### Keywords: Computer Experiments Criteria

### ** Examples


#Compute the maximin criterion of a random LHD(20,2)
des=LHD(n = 20,p = 2)$standDesign
Mm(D=des, power=150)



