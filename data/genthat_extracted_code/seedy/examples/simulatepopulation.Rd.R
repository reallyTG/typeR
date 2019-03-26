library(seedy)


### Name: simulatepopulation
### Title: Simulate a pathogen population
### Aliases: simulatepopulation

### ** Examples

# Generate 5 genome samples at 5 time points
X <- simulatepopulation(m.rate=0.0005, runtime=10000, equi.pop=2000,
                      sample.times=(1:5)*2000, n.samples=5, 
                      genomelength=10000, full=FALSE)
	
# Generate complete observations at 5 time points
X <- simulatepopulation( m.rate=0.0005, runtime=10000, equi.pop=2000,
                      sample.times=(1:5)*2000, genomelength=10000, 
                      bottle.times=5000, bottle.size=1, full=TRUE)



