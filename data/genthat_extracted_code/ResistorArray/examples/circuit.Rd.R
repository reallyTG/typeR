library(ResistorArray)


### Name: circuit
### Title: Mensurates a circuit given potentials of some nodes and current
###   flow into the others
### Aliases: circuit
### Keywords: array

### ** Examples


#reproduce first example on ?cube:
v <- c(0,rep(NA,5),1,NA)
circuit(cube(),v)
circuit(cube(),v+1000)

#  problem: The nodes  of a skeleton cube are at potentials
#  1,2,3,... volts.  What current is needed to maintain this?  Ans:
circuit(cube(),1:8)


#sanity check: maintain one node at 101 volts:
circuit(cube(),c(rep(NA,7),101))

#now, nodes 1-4 have potential 1,2,3,4 volts.  Nodes 5-8 each have one
#Amp shoved in them.  What is the potential of nodes 5-8, and what
#current is needed to maintain nodes 1-4 at their potential?
# Answer:
v <- c(1:4,rep(NA,4))
currents <- c(rep(NA,4),rep(1,4))
circuit(cube(),v,currents)

# Now back to the resistance of a skeleton cube across its sqrt(3)
# diagonal.  To do this, we hold node 1 at 0 Volts, node 7 at 1 Volt,
# and leave the rest floating (see argument v below); we
# seek the current at nodes 1 and 7
# and insist that the current flux into the other nodes is zero
# (see argument currents below):

circuit(L=cube(),v=c(0,NA,NA,NA,NA,NA,1,NA),currents=c(NA,0,0,0,0,0,NA,0))

# Thus the current is 1.2 ohms and the resistance (from V=IR)
# is just 1/1.2 = 5/6 ohms, as required.




