library(StructFDR)


### Name: SimulateData
### Title: Data Simulation Function to Study the Performance of TreeFDR.
### Aliases: SimulateData
### Keywords: Multiple testing False discovery rate Genetics Metagenomics
###   Genomics

### ** Examples

# Generate data set for different scenarios S1-S5
require(StructFDR)
data(throat.parameter)
# Scene 1
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S1', signal.strength = 4)
# Scene 2
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S2', signal.strength = 4)
# Scene 3
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 100, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S3', signal.strength = 4)
# Scene 4
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S4', signal.strength = 2)
# Scene 5
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S5', signal.strength = 4)       



