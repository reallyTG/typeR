library(cheddar)


### Name: OrderCommunity
### Title: Order a community
### Aliases: OrderCommunity
### Keywords: utilities

### ** Examples

data(TL84)
NPS(TL84)

# Order by increasing M
TL84.increasing.M <- OrderCommunity(TL84, 'M', title='Increasing M')
NPS(TL84.increasing.M)

# Order by decreasing M
TL84.decreasing.M <- OrderCommunity(TL84, 'M', decreasing=TRUE)
NPS(TL84.decreasing.M)

# Order by increasing M and N
TL84.increasing.MN <- OrderCommunity(TL84, 'M', 'N')
NPS(TL84.increasing.MN)

# Reverse existing order
TL84.reversed <- OrderCommunity(TL84, new.order=56:1)
NPS(TL84.reversed)

# Sort alphabetically by category and by increasing M within each category
TL84.category <- OrderCommunity(TL84, 'category', 'M')

# Increasing trophic level, then randomly sorted within trophic level
new.order <- order(PreyAveragedTrophicLevel(TL84), sample(1:56))
TL84.increasing.TL <- OrderCommunity(TL84, new.order=new.order, 
                                     title='Increasing TL')
NPS(TL84.increasing.TL)

# Graphically show the effect of different orders
par(mfrow=c(1,2))
PlotPredationMatrix(TL84.increasing.M)
PlotPredationMatrix(TL84.increasing.TL)



