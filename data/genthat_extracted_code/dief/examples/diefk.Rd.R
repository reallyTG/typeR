library(dief)


### Name: diefk
### Title: Compute metric dief@k
### Aliases: diefk
### Keywords: diefficiency diefk,

### ** Examples

# Compute dief@k when k is the number of answers produced 
# by the approach theat generated the least answers. 
diefk(traces, "Q9.sparql") 
# Compute dief@k while producing the first k=1000 answers. 
diefk(traces, "Q9.sparql", 1000)



