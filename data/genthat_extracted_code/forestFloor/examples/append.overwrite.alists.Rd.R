library(forestFloor)


### Name: append.overwrite.alists
### Title: Combine two argument lists
### Aliases: append.overwrite.alists

### ** Examples


arglist1 = alist(monkey="happy",telephone.no=53)
arglist2 = alist(monkey="sad",house.no=12)

#this should yield a alist(monkey="happy", telephone.no=53, house.no=12)
forestFloor:::append.overwrite.alists(arglist1,arglist2)




