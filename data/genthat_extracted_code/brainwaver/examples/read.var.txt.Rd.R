library(brainwaver)


### Name: read.var.txt
### Title: Exportation and importation internal objects.
### Aliases: read.var.txt save.var.txt
### Keywords: utilities

### ** Examples

data(brain)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]


# Construction of the correlation matrices for each level of the wavelet decomposition
wave.var.list<-const.var.list(brain, method = "modwt" ,wf = "la8", n.levels = 4,
                               boundary = "periodic", export.data=FALSE)

#Export the data
save.var.txt(wave.var.list)

#Import the data
read.var.txt()




