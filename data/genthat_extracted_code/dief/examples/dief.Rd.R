library(dief)


### Name: dief
### Title: Tools for Computing Diefficiency Metrics
### Aliases: dief
### Keywords: package

### ** Examples

# This example uses the answer traces provided in the package.  
# These traces record the answers produced by three approaches "Selective", 
# "Not Adaptive", "Random"  when executing the test "Q9.sparql"
data(traces)
	
# Plot answer traces for test "Q9.sparql"
plotAnswerTrace(traces, "Q9.sparql")
	
# Compute dief@t with t the time where the fastest approach produced the last answer.
dieft(traces, "Q9.sparql")
	
# Compute dief@t after 7.5 time units (seconds) of execution. 
dieft(traces, "Q9.sparql", 7.5)



