library(KRIS)


### Name: cal.pc.projection
### Title: Calculate linear principal component analysis (PCA) with
###   projection method for Single-nucleotide polymorphism (SNP) dataset.
### Aliases: cal.pc.projection

### ** Examples

## No test: 

data(example_SNP)

#Create a random list of disease status, 1 = Control and 2 = Case

ind_status <- sample(c(1,2), size = length(sample_labels), replace = T)

PCs <- cal.pc.projection(simsnp$snp, status = ind_status,
labels = sample_labels)
summary(PCs)

#Preview $PC
print(PCs$PC[1:5,1:3])

#Preview $status
print(PCs$status[1:3])

plot3views(PCs$PC[,1:3], PCs$label)

#Calculate the top 3 PCs

PCs <- cal.pc.projection(simsnp$snp, status = ind_status,
labels = sample_labels, no.pc = 3)
summary(PCs)

#Preview $PC
print(PCs$PC[1:5,1:3])

plot3views(PCs$PC[,1:3], PCs$label)

## End(No test)




