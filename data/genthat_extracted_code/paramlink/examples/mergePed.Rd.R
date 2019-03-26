library(paramlink)


### Name: mergePed
### Title: Merge two pedigrees
### Aliases: mergePed

### ** Examples


# Creating a trio where each parent have first cousin parents.
# (Alternatively, this could be built using many calls to addParents().)

x = cousinPed(1)
x = addOffspring(x, father=7, mother=8, noffs=1, id=9)
x = addOffspring(x, father=9, mother=10, noffs=1, id=11)

y = relabel(cousinPed(1), 101:108)
y = addOffspring(y, father=107, mother=108, noffs=1, sex=2, id=10)
y = addOffspring(y, father=9, mother=10, noffs=1, id=11)

# Joining x and y at the common individuals 9,10,11:
z = mergePed(x,y)

# plot all three pedigrees 
par(mfrow=c(1,3))
plot(x); plot(y); plot(z)




