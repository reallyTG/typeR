library(dief)


### Name: dieft
### Title: Compute metric dief@t
### Aliases: dieft
### Keywords: diefficiency dieft,

### ** Examples

# Compute dief@t when t is the time where the fastest approach produced the last answer.
dieft(traces, "Q9.sparql")
# Compute dief@t after 7.5 time units (seconds) of execution. 
dieft(traces, "Q9.sparql", 7.5) 



