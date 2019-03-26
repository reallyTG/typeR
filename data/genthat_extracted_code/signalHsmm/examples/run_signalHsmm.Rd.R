library(signalHsmm)


### Name: run_signalHsmm
### Title: Predict presence of signal peptide in protein
### Aliases: run_signalHsmm
### Keywords: classif

### ** Examples

#run signalHsmm on one sequence
x1 <- run_signalHsmm(benchmark_dat[[1]])

#run signalHsmm on one sequence, but input is a character vector
x2 <- run_signalHsmm(c("M", "A", "G", "K", "E", "V", "I", "F", "I", "M", "A", "L", 
"F", "I", "A", "V", "E", "S", "S", "P", "I", "F", "S", "F", "D", 
"D", "L", "V", "C", "P", "S", "V", "T", "S", "L", "R", "V", "N", 
"V", "E", "K", "N", "E", "C", "S", "T", "K", "K", "D", "C", "G", 
"R", "N", "L", "C", "C", "E", "N", "Q", "N", "K", "I", "N", "V", 
"C", "V", "G", "G", "I", "M", "P", "L", "P", "K", "P", "N", "L", 
"D", "V", "N", "N", "I", "G", "G", "A", "V", "S", "E", "S", "V", 
"K", "Q", "K", "R", "E", "T", "A", "E", "S", "L"))

#run signalHsmm on list of sequences
x3 <- run_signalHsmm(benchmark_dat[1:3])
#see summary of results
summary(x3)
#print results as data frame
pred2df(x3)
#summary one result
summary(x3[[1]])
plot(x3[[1]])



