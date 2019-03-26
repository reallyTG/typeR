library(EntropyExplorer)


### Name: EntropyExplorer
### Title: Differential Shannon Entropy, Differential Coefficient of
###   Variation and Differential Expression
### Aliases: EntropyExplorer
### Keywords: EntropyExplorer, differential entropy, differential
###   coefficient of variation, differential expression

### ** Examples

#These examples use a small subset of mRNA microarray expression data
#obtained from the Gene Expression Omnibus. The files BreastCancer_case_10.txt
#and BreastCancer_control_10.txt are in tab-separated format and
#have been stripped of all metadata, header and footer information. They contain
#the row labels (probe IDs) and column labels (samples).

#Read the two files into matrices
#When reading your own data into memory, replace casefile and controlfile 
#with the complete pathname of your two data files
casefile <- system.file("extdata", "BreastCancer_case_10.txt", package = "EntropyExplorer")
controlfile <- system.file("extdata", "BreastCancer_control_10.txt", package = "EntropyExplorer")

m1<-as.matrix(read.table(file=casefile,header=TRUE, sep="\t",row.names=1))
m2<-as.matrix(read.table(file=controlfile,header=TRUE, sep="\t",row.names=1))

#calculate the difference between mean expression levels for each row
#and sort output by absolute differential values
EntropyExplorer(m1, m2, "de", "v")

#perform a t-test to calculate differential expression (adjusted) p-value
#for each row; return only the 5 most significant raw p-values
EntropyExplorer(m1, m2, "de", "pr", 5)

#calculate the value and (adjusted) p-value for differential Shannon
#entropy for each row using a permutation test with default number of
#permutations; return only the 4 largest by absolute values 
EntropyExplorer(m1, m2, "dse", "bv", 4)

#calculate the value and (adjusted) p-value for differential Shannon
#entropy for the first 4 rows in the input using a permutation test
#with default number of permutations and "holm" p-value adjustment method
EntropyExplorer(m1, m2, "dse", "bu", 4, padjustmethod="holm")

#Calculate the value and (adjusted) p-value for differential Shannon
#entropy for each row using a permutation test with 1100 permutations,
#sort the output by adjusted p-value
EntropyExplorer(m1, m2, "dse", "ba", nperm=1100)

#Calculate the (adjusted) p-value for differential Shannon entropy
#for each row using a permutation test with 1050 permutations;
#return only the 3 most significant raw p-values
EntropyExplorer(m1, m2, "dse", "pr", 3, 1050)

#Calculate the differential coefficient of variation (adjusted) p-value for
#each row using the Fligner-Killeen test
EntropyExplorer(m1, m2, "dcv", "pr")

#Calculate the differential coefficient of variation for each
#row; return the 8 most significant by absolute values
EntropyExplorer(m1, m2, "dcv", "v", 8)

#Add 2.3 to every value in m1 and 2.8 to every value in m2, then
#calculate the differential Shannon entropy for each row;
#return the 6 most significant by absolute values
EntropyExplorer(m1, m2, "dse", "v", 6, shift=c(2.3, 2.8))

#Add an amount to each value in  m1 equal to the absolute
#value of the smallest non-positive number in m1 plus .001.
#Add an amount to each value in m2 equal to the absolute
#value of the smallest non-positive number in m2 plus .001.
#Calculate the differential coefficient of variation and DCV (adjusted)
#p-values for each row, sort output by absolute value, return only
#the 7 most significant by absolute values
EntropyExplorer(m1, m2, "dcv", "bv", 7, shift=c("auto","auto"))



