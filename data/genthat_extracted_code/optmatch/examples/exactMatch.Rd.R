library(optmatch)


### Name: exactMatch
### Title: Generate an exact matching set of subproblems.
### Aliases: exactMatch exactMatch,vector-method exactMatch,formula-method
### Keywords: nonparametric

### ** Examples


data(nuclearplants)

### First generate a standard propensity score
ppty <- glm(pr~.-(pr+cost), family = binomial(), data = nuclearplants)
ppty.distances <- match_on(ppty)

### Only allow matches within the partial turn key plants
pt.em <- exactMatch(pr ~ pt, data = nuclearplants)
as.matrix(pt.em)

### Blunt matches:
match.pt.em <- fullmatch(pt.em)
print(match.pt.em, grouped = TRUE)

### Combine the propensity scores with the subclasses:
match.ppty.em <- fullmatch(ppty.distances + pt.em)
print(match.ppty.em, grouped = TRUE)




