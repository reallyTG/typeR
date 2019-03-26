library(FinePop)


### Name: GstH
### Title: Hedrick's G'st
### Aliases: GstH

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
result.GstH <- GstH(popdata)
write.csv(result.GstH, "result_GstH.csv", na="")
print(as.dist(result.GstH))



