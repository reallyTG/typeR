library(FinePop)


### Name: EBFST
### Title: Empirical Bayes estimator of Fst.
### Aliases: EBFST

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Data load
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# Fst estimation
result.eb <- EBFST(popdata)
ebfst <- result.eb$pairwise$fst
write.csv(ebfst, "result_EBFST.csv", na="")
ebfst.d <- as.dist(ebfst)
print(ebfst.d)

# dendrogram
ebfst.hc <- hclust(ebfst.d,method="average")
plot(as.dendrogram(ebfst.hc), xlab="",ylab="",main="", las=1)

# MDS plot
mds <- cmdscale(ebfst.d)
plot(mds, type="n", xlab="",ylab="")
text(mds[,1],mds[,2], popdata$pop_names)

# NJ tree
library(ape)
ebfst.nj <- nj(ebfst.d)
plot(ebfst.nj,type="u",main="",sub="")



