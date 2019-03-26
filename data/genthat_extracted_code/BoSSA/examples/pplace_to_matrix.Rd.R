library(BoSSA)


### Name: pplace_to_matrix
### Title: Pplace to contingency matrix
### Aliases: pplace_to_matrix

### ** Examples


data(pplace)

### simple example
pplace_to_matrix(pplace,c(rep("sample1",27),rep("sample2",50),rep("sample3",23)))

### using the N option to specify the number of sequence each placement represents
Npplace <- sample(1:20,100,replace=TRUE)
pplace_to_matrix(pplace,c(rep("sample1",27),rep("sample2",50),rep("sample3",23)),N=Npplace)

### with tax_name=TRUE
pplace_to_matrix(pplace,c(rep("sample1",27),rep("sample2",50),rep("sample3",23)),tax_name=TRUE)



