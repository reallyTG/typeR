library(FinePop)


### Name: DJ
### Title: Jost's D
### Aliases: DJ

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Data load
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# Jost's D estimation
result.DJ <- DJ(popdata)
write.csv(result.DJ, "result_DJ.csv", na="")
print(as.dist(result.DJ))



