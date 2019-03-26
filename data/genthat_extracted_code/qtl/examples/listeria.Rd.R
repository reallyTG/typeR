library(qtl)


### Name: listeria
### Title: Data on Listeria monocytogenes susceptibility
### Aliases: listeria
### Keywords: datasets

### ** Examples

data(listeria)
## Don't show: 
listeria <- subset(listeria,chr=c(1,5,6,13,15), ind=!is.na(listeria$pheno[,1]))
## End(Don't show)
# Summaries
summary(listeria)
plot(listeria)

# Take log of phenotype
listeria$pheno[,1] <- log2(listeria$pheno[,1])
plot(listeria)

# Genome scan with a two-part model, using log survival
listeria <- calc.genoprob(listeria, step=2)
out <- scanone(listeria, model="2part", method="em",
               upper=TRUE)

# Summary of the results
summary(out, thr=c(5,3,3), format="allpeaks")

# Plot LOD curves for interesting chromosomes
#     (The two-part model gives three LOD scores)
plot(out, chr=c(1,5,6,13,15), lodcolumn=1:3,
     lty=1, col=c("black","red","blue"))



