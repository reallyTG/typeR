library(MaxPro)


### Name: MaxProRunOrder
### Title: Find the Optimal Sequential Order to Run a Given Experimental
###   Design
### Aliases: MaxProRunOrder
### Keywords: Design of Experiments Computer Experiments

### ** Examples

D0=MaxProLHD(25,2)$Design 

#Assume the first two rows of the design have already been executed 
#Find the optimal run orders

D=MaxProRunOrder(D0,p_nom=0,initial_row=c(1,2))$Design
plot(D[,2],D[,3],xlim=c(0,1),ylim=c(0,1),type="n",
xlab=expression(x[1]),ylab=expression(x[2]),cex.lab=1.5)
text(D[,2],D[,3],labels=D[,1],col='red')



