library(FinePop)


### Name: GstN
### Title: Nei's Gst.
### Aliases: GstN

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Data load
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# Gst estimation
result.gstN <- GstN(popdata)
write.csv(result.gstN, "result_GstN.csv", na="")
print(as.dist(result.gstN))



