library(gclus)


### Name: cpairs
### Title: Enhanced scatterplot matrix
### Aliases: cpairs
### Keywords: multivariate color hplot

### ** Examples


data(USJudgeRatings)
judge.cor <- cor(USJudgeRatings)
judge.color <- dmat.color(judge.cor)
# Colors variables by their correlation.
cpairs(USJudgeRatings,panel.colors=judge.color,pch=".",gap=.5)
judge.o <- order.single(judge.cor)
# Reorder variables so that those with highest correlation 
# are close to the  diagonal.
cpairs(USJudgeRatings,judge.o,judge.color,pch=".",gap=.5)

# Specify your own color scheme
judge.color <- dmat.color(judge.cor, breaks=c(-1,0,.5,.9,1), colors = 
cm.colors(4))

data(bank)
# m is a homogeneity measure of each pairwise variable plot
m <- -colpairs(scale(bank[,-1]), partition.crit,gfun=gave,groups=bank[,1])

# Color panels by level of m and reorder variables so that
# pairs with high m are near the diagonal. Panels shown
# in pink have the highest amount of group homogeneity, as measured by 
# gave.
cpairs(bank[,-1],order=order.single(m), panel.colors=dmat.color(m),
gap=.3,col=c("purple","black")[bank[,"Status"]+1],
pch=c(5,3)[bank[,"Status"]+1])




