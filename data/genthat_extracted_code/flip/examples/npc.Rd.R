library(flip)


### Name: flip.adjust
### Title: Functions for multiplicity corrections
### Aliases: flip.adjust npc flip.adjust flip.npc.methods
### Keywords: htest

### ** Examples



Y=data.frame(matrix(rnorm(50),10,5))
names(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2]+1.5
res = flip(Y,perms=10000)

########npc
p2=npc(res) # same as p2=npc(res,"Fisher")
summary(p2)
p2=npc(res,"minP")
summary(p2)
p2=npc(res,"Fisher",subsets=list(c1=c("A","B"),c2=names(Y)))
summary(p2)
p2=npc(res,"Fisher",subsets=list(c1=c("A","B"),c2=names(Y)),weights=1:5)
summary(p2)


res=flip.adjust(res, method="maxT")

#res=flip.adjust(res,"BH")
##same as
#p.adjust(res,"BH")

## now try
getFlip(res,"Adjust")




