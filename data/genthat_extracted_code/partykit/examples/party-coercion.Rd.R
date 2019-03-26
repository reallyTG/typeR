library(partykit)


### Name: party-coercion
### Title: Coercion Functions
### Aliases: party-coercion as.party as.party.rpart as.party.Weka_tree
###   as.party.XMLNode as.constparty as.simpleparty as.simpleparty.party
###   as.simpleparty.simpleparty as.simpleparty.XMLNode
###   as.simpleparty.constparty pmmlTreeModel
### Keywords: tree

### ** Examples

## fit tree using rpart
library("rpart")
rp <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)

## coerce to `constparty'
as.party(rp)



