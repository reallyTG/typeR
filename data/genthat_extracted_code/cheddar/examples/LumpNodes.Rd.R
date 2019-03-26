library(cheddar)


### Name: LumpNodes
### Title: Lump nodes
### Aliases: LumpNodes
### Keywords: utilities

### ** Examples

data(TL84)

# Lump together isolated nodes in TL84
length(which(IsIsolatedNode(TL84)))  # 6 isolated species
IsolatedNodes(TL84)                  # Names of isolated nodes

lump <- NP(TL84, 'node')             # Existing node names

# Give isolated nodes the same lump value
lump[IsolatedNodes(TL84)] <- 'Isolated nodes lumped together'
TL84.lumped <- LumpNodes(TL84, lump)

NumberOfNodes(TL84)         # 56 nodes in unlumped web
NumberOfNodes(TL84.lumped)  # 51 nodes in lumped web

IsolatedNodes(TL84.lumped)  # A single node


# This trivial example shows that no nodes are lumped if values in lump are 
# unique to each node
lump <- NP(TL84, 'node')
identical(TL84, LumpNodes(TL84, lump, title=CP(TL84, 'title')))


# Ythan Estuary contains two species that are split in to adult and 
# juvenile forms. The example below lumps these in to single species.
data(YthanEstuary)

# The names of nodes in YthanEstuary
lump <- NP(YthanEstuary, 'node')

# European flounder:
# "Platichthys flesus" and "Platichthys flesus (juvenile)"
# Lump these in to one node
lump["Platichthys flesus (juvenile)"==lump] <- "Platichthys flesus"

# Common eider:
# "Somateria mollissima" and "Somateria mollissima (juvenile)"
# Lump these in to one node
lump["Somateria mollissima (juvenile)"==lump] <- "Somateria mollissima"
YthanEstuary.lumped <- LumpNodes(YthanEstuary, lump)


# Examine the computed means for Somateria mollissima
# Arithmetic mean of N is 2592
NP(YthanEstuary.lumped, 'N')['Somateria mollissima']
mean(NP(YthanEstuary, 'N')[c("Somateria mollissima (juvenile)", 
                             "Somateria mollissima")])

# N-weighted mean of M is 1637.018
NP(YthanEstuary.lumped, 'M')['Somateria mollissima']
weighted.mean(NP(YthanEstuary, 'M')[c("Somateria mollissima (juvenile)", 
                                    "Somateria mollissima")], 
              NP(YthanEstuary, 'N')[c("Somateria mollissima (juvenile)", 
                                    "Somateria mollissima")], )


# Plot the original community and the community with lumped nodes
par(mfrow=c(1,2))
plot(YthanEstuary, highlight.nodes=c("Platichthys flesus", 
                                     "Platichthys flesus (juvenile)", 
                                     "Somateria mollissima", 
                                     "Somateria mollissima (juvenile)"))
plot(YthanEstuary.lumped, highlight.nodes=c("Platichthys flesus", 
                                            "Somateria mollissima"))



