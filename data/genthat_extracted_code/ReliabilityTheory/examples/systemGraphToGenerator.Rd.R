library(ReliabilityTheory)


### Name: systemGraphToGenerator
### Title: Construct a Continuous-time Markov Chain Generator
### Aliases: systemGraphToGenerator
### Keywords: generator matrix system signature

### ** Examples

# Get the generator representing a repairable 5 component 'bridge' system with
# failure rate 1 and repair rate 365.
data(sccsO5)
G <- systemGraphToGenerator(sccsO5[[18]]$graph, 1, 365)



