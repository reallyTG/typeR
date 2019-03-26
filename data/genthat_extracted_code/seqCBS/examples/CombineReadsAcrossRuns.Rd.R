library(seqCBS)


### Name: CombineReadsAcrossRuns
### Title: Combine multiple read lists
### Aliases: CombineReadsAcrossRuns

### ** Examples

data(JSSim_NormalSim1)
data(JSSim_NormalSim2)
write.table(JSSim_NormalSim1, file="JSSim_NormalSim1.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(JSSim_NormalSim2, file="JSSim_NormalSim2.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
JSSim_Normal1 = readSeqChiang("JSSim_NormalSim1.txt")
JSSim_Normal2 = readSeqChiang("JSSim_NormalSim2.txt")
file.remove(c("JSSim_NormalSim1.txt", "JSSim_NormalSim2.txt"))
combJSNormal = CombineReadsAcrossRuns(list(JSSim_Normal1, JSSim_Normal2))
print(c(length(JSSim_Normal1$seqF), length(JSSim_Normal2$seqF), length(combJSNormal$seqF)))



