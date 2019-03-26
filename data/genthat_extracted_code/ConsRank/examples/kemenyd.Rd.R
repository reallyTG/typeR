library(ConsRank)


### Name: kemenyd
### Title: Kemeny distance
### Aliases: kemenyd
### Keywords: Kemeny distance

### ** Examples

data(Idea)
RevIdea=6-Idea ##as 5 means "most associated", it is necessary compute the reverse 
#ranking of each rankings to have rank 1 = "most associated" and rank 5 = "least associated"
KD=kemenyd(RevIdea)
KD2=kemenyd(RevIdea[1:10,],RevIdea[55,])




