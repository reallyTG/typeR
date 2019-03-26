library(FinePop)


### Name: EBGstH
### Title: Empirical Bayes estimator of Hedrick's G'st
### Aliases: EBGstH

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Data load
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# Hedrick's G'st estimation
result.EBGstH <- EBGstH(popdata)
write.csv(result.EBGstH, "result_EBGstH.csv", na="")
print(as.dist(result.EBGstH))



