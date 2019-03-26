library(pdfCluster)


### Name: pdfCluster
### Title: Clustering via nonparametric density estimation
### Aliases: pdfCluster pdfCluster-methods pdfCluster,data.frame-method
###   pdfCluster,matrix-method pdfCluster,numeric-method
###   pdfCluster,pdfCluster-method
### Keywords: methods cluster

### ** Examples

##########
#example 1
###########
# not run here for time reasons
#loading data
data(oliveoil)

#preparing data
olive1 <- 1 + oliveoil[, 3:10]
margin <- apply(data.matrix(olive1),1,sum)
olive1 <- olive1/margin
alr <- (-log( olive1[, -4]/olive1[, 4]))
#select the first 5 principal components
x <- princomp(alr, cor=TRUE)$scores[, 1:5]

#clustering
# not run here for time reasons
#cl <- pdfCluster(x, h = h.norm(x), hmult=0.75)
#summary(cl)
#plot(cl)

#comparing groups with original macro-area membership
#groups <- groups(cl)
#table(oliveoil$macro.area, groups)

#cluster cores
#table(groups(cl, stage = 0))

##########
#example 2
###########
# not run here for time reasons
# loading data
#data(wine)
#x <-wine[ ,-1]
#gr <- wine[ ,1]

# when data are high-dimensional, an adaptive kernel estimator is preferable 
# building the Delaunay graph entails a too high computational effort
# use option "pairs" to build the graph 
# it is the default option for dimension >6 


# cl <- pdfCluster(x, graphtype="pairs", bwtype="adaptive")
# summary(cl)
# plot(cl)

#comparison with original groups
#table(groups(cl),gr)

# a better classification is obtained with larger value of lambda
# not necessary to run the whole procedure again
# a pdfCluster method applies on pdfCluster-class objects!

#cl1 <- pdfCluster(cl, lambda=0.25)
#table(gr, groups(cl1))



