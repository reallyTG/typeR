library(COSINE)


### Name: cond.fyx
### Title: Compute the ECF-statistics measuring the differential
###   correlation of gene pairs
### Aliases: cond.fyx

### ** Examples


#load two of the simulated datasets

data(simulated_data)
set1_data<-simulated_data[[1]]
control_data<-simulated_data[[7]]

num_sample <- dim(set1_data)[1]
num_gene <- dim(set1_data)[2]

type <- c(rep(0,num_sample),rep(1,num_sample))

#Compute the ECF-statistic for the gene pair of gene 1 and gene 2

i=1
j=2
data.x <- c(set1_data[,i],control_data[,i])
data.y <- c(set1_data[,j],control_data[,j])

ecf <- ( cond.fyx(data.y,data.x,type) + 
        cond.fyx(data.x,data.y,type) )/2




