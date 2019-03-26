library(COSINE)


### Name: diff_gen_PPI
### Title: Generate the scaled node score and scaled edge score for nodes
###   and edges in the background network
### Aliases: diff_gen_PPI

### ** Examples


data(simulated_data)
data(PPI)
data1 <- simulated_data[[1]]
data2 <- simulated_data[[7]]
colnames(data1)<-colnames(data2)<-as.character(1:500)
test <- diff_gen_PPI(data1[,1:20],data2[,1:20],PPI)



