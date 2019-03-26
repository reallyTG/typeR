library(G1DBN)


### Name: BuildNetwork
### Title: Network object creation
### Aliases: BuildNetwork
### Keywords: datagen

### ** Examples

library(G1DBN)

## ========================
## SIMULATING THE NETWORK
## ________________________

## number of genes
p <- 10
## number of time points
n <- 20
## proportion of genes
geneProp <- 0.05
## the network - adjacency Matrix
MyNet <- SimulNetworkAdjMatrix(p,geneProp,c(-1.5,-0.5,0.5,1.5))

cat("\n==========================================\n")
cat("SIMULATION\n")

## ======================================
## SIMULATING THE TIME SERIES EXPERIMENTS
## ______________________________________
##
## Autoregressive model
##
cat("Time series experiments with")

## initializing the B vector
B <- runif(p,-1,1)
## initializing the variance of the noise
sigmaEps <- runif(p,0.1,0.5)
## initializing the process Xt
X0 <- B + rnorm(p,0,sigmaEps*10)
## the times series process
Xn <- SimulGeneExpressionAR1(MyNet$A,B,X0,sigmaEps,n)

## ======================================
## NETWORK INFERENCE WITH G1DBN
## ______________________________________
##
cat("\n==========================================\n")
cat("NETWORK INFERENCE\n")
cat("Using a Dynamic Bayesian Network model\n")

## STEP 1
## ------
cat("STEP 1...\n")
S1 <- DBNScoreStep1(Xn, method='ls')

## STEP 2
## ------
cat("STEP 2...\n")
alpha1=0.5
S2 <- DBNScoreStep2(S1$S1ls, data=Xn, method='ls', alpha1=alpha1)

## ======================================
## POST TREATMENTS

## building the inferred Graph
G1 <- BuildEdges(S1$S1ls,threshold=alpha1,dec=FALSE)

## encoding as the adjancecy matrix graph
Step1InferredNet <- BuildNetwork(G1,1:p)
Step1InferredNet

#Step 2
alpha2=0.05
G2 <- BuildEdges(S2,threshold=alpha2,dec=FALSE)
Step2InferredNet <- BuildNetwork(G2,1:p)


## ======================================
## PLOTTING THE RESULTS...
## ______________________________________
## Not run: 
##D cat("\n==========================================\n")
##D cat("SUMMARY\n")
##D cat("Plotting the results...\n")
##D split.screen(c(1,3))
##D 
##D 
##D ## The Original graph and data
##D ## ---------------------------
##D # set the edges list of the simulated network
##D G0 <- BuildEdges(MyNet$AdjMatrix,threshold=0.9,dec=TRUE)
##D 
##D ## Nodes coordinates are calculated according to the global structure of the network
##D all_parents=c(G0[,1],G1[,1], G2[,1])
##D all_targets=c(G0[,2],G1[,2], G2[,2])
##D posEdgesG0=1:dim(G0)[1]
##D posEdgesG1=(dim(G0)[1]+1):(dim(G0)[1]+dim(G1)[1])
##D posEdgesG2=(dim(G0)[1]+dim(G1)[1]+1):length(all_parents)
##D 
##D ## Global network with all the edges
##D netAll =
##D graph.edgelist(cbind(as.character(all_parents),as.character(all_targets)))
##D 
##D ## Nodes coordinates
##D nodeCoord=layout.fruchterman.reingold(netAll)
##D 
##D 
##D #after Step 1
##D screen(1)
##D # set the edges list
##D netG1 = graph.edgelist(cbind(as.character(G1[,1]),as.character(G1[,2])))
##D # set the object for plotting the network with global coordinates of all nodes
##D G1toPlot=delete.edges(netAll, E(netAll)[c(posEdgesG0,posEdgesG2)-1] )
##D # plot the network
##D plot(G1toPlot, layout=nodeCoord, vertex.label = 
##D get.vertex.attribute(G1toPlot, name="name"), edge.arrow.size = 0.2,
##D main="G1DBN Inferred network:\n Step 1")
##D 
##D #after Step 2
##D screen(2)
##D # set the edges list
##D netG2 = graph.edgelist(cbind(as.character(G2[,1]),as.character(G2[,2])))
##D # set the object for plotting the network with global coordinates of all nodes
##D G2toPlot=delete.edges(netAll, E(netAll)[c(posEdgesG0,posEdgesG1)-1 ] )
##D # plot the network
##D plot(G2toPlot, layout=nodeCoord, vertex.label = 
##D get.vertex.attribute(G2toPlot, name="name"),edge.arrow.size = 0.2,
##D main="G1DBN Inferred network:\n Step 2")
##D 
##D screen(3)
##D net0 = graph.edgelist(cbind(as.character(G0[,1]),as.character(G0[,2])))
##D # set the object for plotting the network with global coordinates of all nodes
##D G0toPlot=delete.edges(netAll, E(netAll)[c(posEdgesG1,posEdgesG2)-1] )
##D plot(G0toPlot, layout=nodeCoord, vertex.label =
##D get.vertex.attribute(G0toPlot, name="name"), edge.arrow.size = 0.2,
##D main="Simulated network:")
##D 
##D close.screen(all = TRUE)
## End(Not run)
cat("")
cat("\nDONE !\n")



