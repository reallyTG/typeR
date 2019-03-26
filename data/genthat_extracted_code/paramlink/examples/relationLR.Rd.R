library(paramlink)


### Name: relationLR
### Title: Relationship Likelihood Ratio
### Aliases: relationLR

### ** Examples


############################################
# A partial DNA profile is obtained from the person 
# denoted 4 in the figure produced below 
# There are two possibilities: 
# H1: 4 is the missing relative of 3 and 6 (as shown to the left) or 
# H2: 4 is unrelated to 3 and 6.
############################################
p = c(0.2, 0.8)
alleles = 1:length(p)
g3 = c(1,1); g4 = c(1,0); g6 = c(2,2)
x1 = nuclearPed(2)
x1 = addOffspring(x1, father = 4, sex = 1, noff = 1)
m = marker(x1, 3, g3, 4, g4, 6, g6, alleles = alleles, afreq = p)
x1 = addMarker(x1, m)
x2 = nuclearPed(2)
x2 = addOffspring(x2, father = 4, sex = 1, noff = 1)
m = marker(x2, 3, g3, 6, g6, alleles = alleles, afreq = p)
x2 = addMarker(x2, m)
missing = singleton(4, sex = 1)
m.miss = marker(missing, g4, alleles = alleles, afreq = p)
missing = addMarker(missing, m.miss)
x2 = relabel(x2, c(1:3, 99, 5:6), 1:6)
known = list(c(3, g3), c(4,g4), c(6, g6))
LR = relationLR(x1, list(x2, missing), ids = c(3,4,6),
                alleles = alleles, afreq = p, known = known,
                title1 = 'H1: Missing person 4 related',
                title2 = 'H2:Missing person 4 unrelated')$LR
# Formula:
p = p[1]
LR.a = (1+p)/(2*p*(2-p))
stopifnot(abs(LR - LR.a) < 1e-10)




