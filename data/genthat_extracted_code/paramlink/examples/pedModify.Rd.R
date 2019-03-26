library(paramlink)


### Name: pedModify
### Title: Modify the pedigree of 'linkdat' objects
### Aliases: pedModify swapSex swapAff addOffspring addSon addDaughter
###   addParents removeIndividuals branch trim relabel

### ** Examples


x = linkdat(toyped)

# To see the effect of each command below, use plot(x) in between.
x = addParents(x, id=2, father=5, mother=6)

x = swapSex(x, c(1,5))
x = swapSex(x, c(2,6))

x = addOffspring(x, mother=6, noffs=2, id=c(7,10))
x = removeIndividuals(x, 3)
x = swapAff(x, c(4,10))

stopifnot(setequal(x$orig.ids, c(1,2,4,5,6,7,10,11)))

# Trimming a pedigree
x = linkdat(dominant)
x_affectedOnly = trim(x, keep='affected')

unavail = trim(x, keep='available', return.ids=TRUE)
nonaff = trim(x, keep='affected', return.ids=TRUE)
stopifnot(setequal(unavail, c(5, 19:23)), setequal(nonaff, c(6:7, 12:13, 19:23)))




