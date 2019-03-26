library(lodGWAS)


### Name: lod_QC
### Title: Checking the coding of phenotype and outsideLOD values
### Aliases: lod_QC

### ** Examples

phenos <- data.frame(FID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                     IID = c("female1", "male2", "male3", "female4", "female5",
                             "male6", "female7", "male8", "male9", "male10"),
                     sex = c(0, 1, 1, 0, 0, 1, 0, 1, 1, 1),
                     outcome1 = c(0.3, 0.5, 0.9, 0.7, 2, 2, 0.1, 1.1, 2, 0.7),
                     outsideLOD = as.integer(c(1, 1, 1, 1, 1, 0, 2, 1, 0, 1)),
                     stringsAsFactors = FALSE)

lod_QC(phenofile = phenos, pheno_name = "outcome1",
       outputfile = "Sample_QC", lower_limit = 0.1, upper_limit = 2)



