library(QuantNorm)


### Name: connection.matrix
### Title: Construct connection matrix for network analysis
### Aliases: connection.matrix

### ** Examples


library(network); library(ggplot2); library(sna); library(GGally) #drawing network graph

data("ENCODE")

#Assigning the batches based on species
batches <- c(rep(1,13),rep(2,13))

#QuantNorm correction
corrected.distance.matrix <- QuantNorm(ENCODE,batches,method='row/column', cor_method='pearson',
                                       logdat=FALSE,standardize = TRUE, tol=1e-4)

#Constructing connection matrix

mat <- connection.matrix(mat=corrected.distance.matrix,label=colnames(corrected.distance.matrix))

#Creating network object and plot
ENCODE.net=network(mat, directed=FALSE)
ENCODE.net %v% "Species" <- c(rep('Human',13),rep('Mouse',13))
p0 <- ggnet2(ENCODE.net,label=TRUE,color = 'Species', palette = "Set2",
             size = 3, vjust = -0.6,mode = "kamadakawai",label.size = 3,
             color.legend = 'Species')+theme(legend.position = 'bottom')
plot(p0)



