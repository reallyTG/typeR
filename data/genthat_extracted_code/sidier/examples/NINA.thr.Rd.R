library(sidier)


### Name: NINA.thr
### Title: No Isolated Nodes Allowed network
### Aliases: NINA.thr

### ** Examples


#EXAMPLE 1: FEW OFF-DIAGONAL ZEROS
#Generating a distance matrix:
Dis1<-matrix(c(
0.00,0.77,0.28,0.94,0.17,0.14,0.08,0.49,0.64,0.01,
0.77,0.00,0.12,0.78,0.97,0.02,0.58,0.09,0.36,0.33,
0.28,0.12,0.00,0.70,0.73,0.06,0.50,0.79,0.80,0.94,
0.94,0.78,0.70,0.00,0.00,0.78,0.04,0.42,0.25,0.85,
0.17,0.97,0.73,0.00,0.00,0.30,0.55,0.12,0.68,0.99,
0.14,0.02,0.06,0.78,0.30,0.00,0.71,1.00,0.64,0.88,
0.08,0.58,0.50,0.04,0.55,0.71,0.00,0.35,0.84,0.76,
0.49,0.09,0.79,0.42,0.12,1.00,0.35,0.00,0.56,0.81,
0.64,0.36,0.80,0.25,0.68,0.64,0.84,0.56,0.00,0.62,
0.01,0.33,0.94,0.85,0.99,0.88,0.76,0.81,0.62,0.00),ncol=10)
colnames(Dis1)<-c(paste("Pop",c(1:10),sep=""))
row.names(Dis1)<-colnames(Dis1)

# No percolation threshold can be found.
#perc.thr(Dis1)

#Check Dis1 and merge populations showing distances equal to zero:
Dis1
Dis1_Merged<-mergeNodes(dis=Dis1)
#Check the merged matrix. A new "population" has been defined merging populations 4 and 5.
#Distances between the merged and the remaining populations are estimated as the arithmetic mean.
Dis1_Merged
# It is now possible to estimate a percolation threshold
perc.thr(dis=Dis1_Merged,ptPDF=FALSE, estimPDF=FALSE, estimOutfile=FALSE) 

# EXAMPLE 2: TOO MANY OFF-DIAGONAL ZEROS
#Generating a distance matrix:
Dis2<-matrix(c(
0.00,0.77,0.28,0.00,0.17,0.14,0.00,0.49,0.64,0.01,
0.77,0.00,0.12,0.00,0.97,0.02,0.00,0.09,0.36,0.33,
0.28,0.12,0.00,0.70,0.73,0.06,0.50,0.79,0.00,0.94,
0.00,0.00,0.70,0.00,0.00,0.78,0.04,0.00,0.00,0.00,
0.17,0.97,0.73,0.00,0.00,0.30,0.55,0.12,0.00,0.00,
0.14,0.02,0.06,0.78,0.30,0.00,0.71,1.00,0.64,0.00,
0.00,0.00,0.50,0.04,0.55,0.71,0.00,0.35,0.84,0.00,
0.49,0.09,0.79,0.00,0.12,1.00,0.35,0.00,0.56,0.81,
0.64,0.36,0.00,0.00,0.00,0.64,0.84,0.56,0.00,0.62,
0.01,0.33,0.94,0.00,0.00,0.00,0.00,0.81,0.62,0.00),ncol=10)
colnames(Dis2)<-c(paste("Pop",c(1:10),sep=""))
row.names(Dis2)<-colnames(Dis2)

# No percolation threshold can be found
#perc.thr(Dis2)

#Check Dis2 and merge populations showing distances equal to zero:
Dis2
Dis2_Merged<-mergeNodes(dis=Dis2)

#Check the merged matrix. Many new "populations" have been defined
#and both the new matrix and the resulting network
#are difficult to interpret:
Dis2_Merged
perc.thr(dis=Dis2_Merged,ptPDF=FALSE, estimPDF=FALSE, estimOutfile=FALSE) 

#Instead of percolation network, representing zeros as the lowest values
#may be informative:
zero.thr(dis=Dis2,ptPDF=FALSE)
# Adjusting sizes and showing modules:
zero.thr(dis=Dis2,ptPDF=FALSE,cex.label=0.8,cex.vertex=1.2,modules=TRUE)

#In the previous example, the 'zero.thr' method is unuseful: 
zero.thr(dis=Dis1,ptPDF=FALSE)

#In both cases, the 'No Isolation Nodes Allowed' method
#yields an informative matrix:
NINA.thr(dis=Dis1)
NINA.thr(dis=Dis2)



