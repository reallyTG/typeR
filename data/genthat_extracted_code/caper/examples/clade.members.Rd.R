library(caper)


### Name: clade.members
### Title: Identify tips descended from a node
### Aliases: clade.members clade.members.list
### Keywords: manip utilities

### ** Examples

data(perissodactyla)
# use comparative.data to add node labels
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial, na.omit=FALSE)
plot(perisso$phy, show.node.label=TRUE)
clade.members(22, perisso$phy, tip.labels=TRUE)
clade.members.list(perisso$phy, tip.labels=FALSE)




