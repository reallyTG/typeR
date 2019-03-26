library(preputils)


### Name: filterpca
### Title: Filter data set using PCA
### Aliases: filterpca

### ** Examples

    a = iris[-5]
    b0 = filterpca(a,npc=4,res="b")
    b1 = filterpca(a,npc=3,res="b")
    b2 = filterpca(a,npc=2,res="b")
    pairs(b0,pch=20,col=iris$Species)
    pairs(b1,pch=20,col=iris$Species)
    pairs(b2,pch=20,col=iris$Species)



