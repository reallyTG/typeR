library(SNFtool)


### Name: standardNormalization
### Title: Standard Normalization
### Aliases: standardNormalization

### ** Examples


## Data1 is of size n x d_1, 
## where n is the number of patients, d_1 is the number of genes, 
## Data2 is of size n x d_2, 
## where n is the number of patients, d_2 is the number of methylation
data(Data1)
data(Data2)

Data1 = standardNormalization(Data1);
Data2 = standardNormalization(Data2);



