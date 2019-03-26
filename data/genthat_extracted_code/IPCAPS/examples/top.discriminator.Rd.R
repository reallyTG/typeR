library(IPCAPS)


### Name: top.discriminator
### Title: Detecting top discriminators between two groups
### Aliases: top.discriminator

### ** Examples


## No test: 
# Importantly, bed file, bim file, and fam file are required
# Use the example files embedded in the package
BED.file <- system.file("extdata","IPCAPS_example.bed",package="IPCAPS")
LABEL.file <- system.file("extdata","IPCAPS_example_individuals.txt",package="IPCAPS")
my.cluster <- ipcaps(bed=BED.file,label.file=LABEL.file,lab.col=2,out=tempdir())
table(my.cluster$cluster$label,my.cluster$cluster$group)
# 1 2 3 4 5 6
# outlier4 5 4 1 0 0 0
# pop1 0 0 0 0 250 0
# pop2 0 0 0 0 0 250
# pop3 0 0 0 250 0 0

#Identify top discriminators between groups, for example, group 4 and group 5
top.snp <-top.discriminator(my.cluster,4,5)
#or, specify the bim file
#top.snp <-top.discriminator(my.cluster,4,5,bim.file="IPCAPS_example.bim")
head(top.snp)
# chr SNP centimorgans position allele1 allele2 Fst
#V5452 1 marker5452 0 54520000 A T 0.11337260
#V2348 1 marker2348 0 23480000 A T 0.11194490
#V8244 1 marker8244 0 82440000 A T 0.09556580
#V5972 1 marker5972 0 59720000 A T 0.08747794
#V3561 1 marker3561 0 35610000 A T 0.08725860
#V8419 1 marker8419 0 84190000 A T 0.08293494

#Alternatively, it is possible to refer to node numbers instead of group numbers
table(my.cluster$cluster$label,my.cluster$cluster$node)
# 2 4 6 7 8 9
# outlier4 5 4 1 0 0 0
# pop1 0 0 0 0 250 0
# pop2 0 0 0 0 0 250
# pop3 0 0 0 250 0 0

#Identify top discriminators between groups, for example, node 7 and node 8
top.snp2 <-top.discriminator(my.cluster,7,8,use.node.number=TRUE)
head(top.snp2)
# chr SNP centimorgans position allele1 allele2 Fst
#V5452 1 marker5452 0 54520000 A T 0.11337260
#V2348 1 marker2348 0 23480000 A T 0.11194490
## End(No test)



