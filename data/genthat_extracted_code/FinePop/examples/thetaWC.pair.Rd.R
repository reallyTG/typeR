library(FinePop)


### Name: thetaWC.pair
### Title: Weir and Cockerham's theta adapted for pairwise Fst.
### Aliases: thetaWC.pair

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Data load
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# theta estimation
result.theta.pair <- thetaWC.pair(popdata)
write.csv(result.theta.pair, "result_thetaWCpair.csv", na="")
print(as.dist(result.theta.pair))



