library(comf)


### Name: dfASHRAETableG11
### Title: Data from Table G1-1 of ASHRAE 55-2013
### Aliases: dfASHRAETableG11 dfASHRAE
### Keywords: datasets

### ** Examples

data(dfASHRAETableG11)
head(dfASHRAETableG11)

# using option obj="pmvadj" in order to compare with ASHRAE Table G1-1
SET <- sapply(seq(nrow(dfASHRAETableG11)), function(x) { calcSET(dfASHRAETableG11$ta[x], 
dfASHRAETableG11$tr[x], dfASHRAETableG11$vel[x], dfASHRAETableG11$rh[x], dfASHRAETableG11$clo[x], 
dfASHRAETableG11$met[x], obj="pmvadj") } ) 
plot(SET~dfASHRAETableG11$set)
data.frame(set=dfASHRAETableG11$set, SET)

# using option obj="set" (standard) in order to calculate values for original SET values
SET2 <- sapply(seq(nrow(dfASHRAETableG11)), function(x) { calcSET(dfASHRAETableG11$ta[x], 
dfASHRAETableG11$tr[x], dfASHRAETableG11$vel[x], dfASHRAETableG11$rh[x], dfASHRAETableG11$clo[x], 
dfASHRAETableG11$met[x], ) } ) 
plot(SET2~dfASHRAETableG11$set)
data.frame(set=dfASHRAETableG11$set, SET2)




