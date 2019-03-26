library(ACTCD)


### Name: npar.CDM
### Title: Main function for ACTCD package
### Aliases: npar.CDM

### ** Examples

# Classification based on the simulated data and Q matrix
data(sim.dat)
data(sim.Q)
# Information about the dataset
N <- nrow(sim.dat) #number of examinees
J <- nrow(sim.Q) #number of items
K <- ncol(sim.Q) #number of attributes

# Compare the difference in results among different labeling methods
# Note that the default cluster method is HACA
labeled.obj.2a <- npar.CDM(sim.dat, sim.Q, label.method="2a")
labeled.obj.2b <- npar.CDM(sim.dat, sim.Q, label.method="2b")
labeled.obj.3 <- npar.CDM(sim.dat, sim.Q, label.method="3")
data(perm3)
labeled.obj.1 <- npar.CDM(sim.dat, sim.Q, label.method="1",perm=perm3)
remove(perm3)

#User-specified number of latent clusters
M <- 5
labeled.obj.2b <- npar.CDM(sim.dat, sim.Q, cluster.method="HACA", 
HACA.cut=M, label.method="2b")
labeled.obj.2a <- npar.CDM(sim.dat, sim.Q, cluster.method="HACA", 
HACA.cut=M, label.method="2a")
#The attribute pattern for each examinee
attpatt <- labeled.obj.2b$att.pattern





