library(KRIS)


### Name: write.bed
### Title: Write an list of SNP object to the binary PLINK format (BED,
###   BIM, and FAM)
### Aliases: write.bed

### ** Examples



#Load example data
data(example_SNP)

#Save 'simsnp' to the file as defined in 'save.file'
save.file <- file.path(tempdir(),"new_SNP")
write.bed(simsnp , save.file)



