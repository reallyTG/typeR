library(Blaunet)


### Name: export.nodal
### Title: Outputs all node-level measures computed by the user
### Aliases: export.nodal

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
#blau object will store whatever you compute
b <- nodal.global(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
b <- nodal.local(b, dev.range = rep(1.5, 10), focal.niche = 'grppta')
# 10 is the number of dimensions in the command line above 
export.nodal(b) #will export global and local
export.nodal(b, niches = FALSE) #suppress niche export




