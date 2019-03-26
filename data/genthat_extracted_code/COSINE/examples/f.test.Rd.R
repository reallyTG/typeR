library(COSINE)


### Name: f.test
### Title: To get the F-statistics for each gene
### Aliases: f.test

### ** Examples


#Load the simulated datasets

data(simulated_data)
data1 <- simulated_data[[1]]
data2 <- simulated_data[[7]]

#Calculate the F-statistics for genes 1~10

num_sample <- dim(data1)[1]
diff_expr <- rep(0,10)
type <- c(rep(0,num_sample),rep(1,num_sample))

for(i in 1:10){
       data <- c(data1[,i],data2[,i])
       diff_expr[i] <- f.test(data,type)
    }




