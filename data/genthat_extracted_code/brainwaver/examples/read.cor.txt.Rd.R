library(brainwaver)


### Name: read.cor.txt
### Title: Exportation and importation of internal objects.
### Aliases: read.cor.txt save.cor.txt
### Keywords: utilities

### ** Examples

data(brain)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]



# Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 4, 
                              boundary = "periodic", p.corr = 0.975,export.data=FALSE)

#Export the data
save.cor.txt(wave.cor.list)

#Import the data
read.cor.txt()




