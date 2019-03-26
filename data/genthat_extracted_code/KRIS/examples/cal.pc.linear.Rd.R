library(KRIS)


### Name: cal.pc.linear
### Title: Calculate linear principal component analysis (PCA) from numeric
###   data and Single-nucleotide polymorphism (SNP) dataset
### Aliases: cal.pc.linear

### ** Examples


#Load simulated dataset
## No test: 
data(example_SNP)

#Using default parameters
PCs <- cal.pc.linear(simsnp$snp)
summary(PCs)

#Preview $PC
print(PCs$PC[1:5,1:3])

#Preview $evalue
print(PCs$evalue[1:3])

plot3views(PCs$PC[,1:3], sample_labels)

#Calculate PCs without PC scores

PCs <- cal.pc.linear(simsnp$snp, PCscore = FALSE)
summary(PCs)

#Preview $PC
print(PCs$PC[1:5,1:3])

#Preview $evalue
print(PCs$evalue[1:3])

plot3views(PCs$PC[,1:3], sample_labels)

#Calculate the top 3 PCs
PCs <- cal.pc.linear(simsnp$snp, no.pc = 3)
summary(PCs)

#Preview $PC
print(PCs$PC[1:5,1:3])

#Preview $evalue
print(PCs$evalue[1:3])

plot3views(PCs$PC[,1:3], sample_labels)
## End(No test)



