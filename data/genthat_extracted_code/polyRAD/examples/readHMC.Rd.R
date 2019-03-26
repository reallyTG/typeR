library(polyRAD)


### Name: readHMC
### Title: Import read depth from UNEAK
### Aliases: readHMC
### Keywords: file

### ** Examples

# for this example we'll create dummy files rather than using real ones
hmc <- tempfile()
write.table(data.frame(rs = c("TP1", "TP2", "TP3"),
                       ind1_merged_X3 = c("15|0", "4|6", "13|0"),
                       ind2_merged_X3 = c("0|0", "0|1", "0|5"),
                       HetCount_allele1 = c(0, 1, 0),
                       HetCount_allele2 = c(0, 1, 0),
                       Count_allele1 = c(15, 4, 13),
                       Count_allele2 = c(0, 7, 5),
                       Frequency = c(0, 0.75, 0.5)), row.names = FALSE,
            quote = FALSE, col.names = TRUE, sep = "\t", file = hmc)
fas <- tempfile()
writeLines(c(">TP1_query_64",
             "TGCAGAAAAAAAACGCTCGATGCCCCCTAATCCGTTTTCCCCATTCCGCTCGCCCCATCGGAGT",
             ">TP1_hit_64",
             "TGCAGAAAAAAAACGCTCGATGCCCCCTAATCCGTTTTCCCCATTCCGCTCGCCCCATTGGAGT",
             ">TP2_query_64",
             "TGCAGAAAAACAACACCCTAGGTAACAACCATATCTTATATTGCCGAATAAAAAACAACACCCC",
             ">TP2_hit_64",
             "TGCAGAAAAACAACACCCTAGGTAACAACCATATCTTATATTGCCGAATAAAAAATAACACCCC",
             ">TP3_query_64",
             "TGCAGAAAACATGGAGAGGGAGATGGCACGGCAGCACCACCGCTGGTCCGCTGCCCGTTTGCGG",
             ">TP3_hit_64",
             "TGCAGAAAACATGGAGATGGAGATGGCACGGCAGCACCACCGCTGGTCCGCTGCCCGTTTGCGG"),
             fas)

# now read the data
mydata <- readHMC(hmc, fastafile = fas)

# inspect the results
mydata
mydata$alleleDepth
mydata$alleleNucleotides
row.names(mydata$locTable)



