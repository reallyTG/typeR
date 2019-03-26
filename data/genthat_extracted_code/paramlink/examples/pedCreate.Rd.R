library(paramlink)


### Name: pedCreate
### Title: Create simple pedigrees
### Aliases: pedCreate nuclearPed cousinsPed halfCousinsPed doubleCousins
###   doubleFirstCousins quadHalfFirstCousins fullSibMating halfSibStack
###   cousinPed halfCousinPed

### ** Examples


# A nuclear family with 2 boys and 3 girls, 
# where the father and the two boys are affected.
x = nuclearPed(noffs=5, sex=c(1,1,2,2,2))
x = swapAff(x, ids=c(1,3,4))

# Half sibs:
halfCousinsPed(degree=0)

# Grand aunt:
cousinsPed(degree=0, removal=2)

# Second cousins once removed.
cousinsPed(degree=2, removal=1)

# Again second cousins once removed, 
# but with the 'removal' on the left side.
cousinsPed(degree=3, degree2=2)

# A child of first cousin parents.
cousinsPed(degree=1, child=TRUE)

# Consecutive brother-sister matings.
fullSibMating(3)

# Simultaneous half siblings and half first cousins
halfSibStack(2)

# Double first cousins
doubleFirstCousins()

# Quadruple half first cousins
# Weird plotting behaviour for this pedigree. 
x = quadHalfFirstCousins()
#plot(x)




