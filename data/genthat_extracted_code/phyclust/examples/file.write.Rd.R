library(phyclust)


### Name: file.write
### Title: Write Data to Files by Formats
### Aliases: write.fasta write.fasta.format write.phylip
###   write.phylip.format write.paml write.paml.format
### Keywords: file I/O

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # PHYLIP
##D data.path <- paste(.libPaths()[1], "/phyclust/data/crohn.phy", sep = "")
##D my.snp <- read.phylip(data.path, code.type = "SNP")
##D write.phylip(my.snp$org, "new.crohn.phy", code.type = "SNP")
##D 
##D # FASTA
##D data.path <- paste(.libPaths()[1], "/phyclust/data/pony625.fas", sep = "")
##D (my.pony <- read.fasta(data.path))
##D write.fasta(my.pony$org, "new.pony.fas")
##D 
##D # PAML
##D write.paml(my.pony$org, "new.pony.pam")
##D 
##D # Amino acid in PHYLIP
##D aa.aid <- nid2aid(my.pony$org)
##D aa.acode <- aid2acode(aa.aid)
##D write.phylip(aa.aid, "new.pony.aa.phy", code.type = "AMINO_ACID")
##D write.phylip.format(aa.aid, "new.pony.aa.aid.phy", sep = ",")
##D write.phylip.format(aa.acode, "new.pony.aa.acode.phy")
##D 
##D # Amino acid in FASTA
##D write.fasta(aa.aid, "new.pony.aa.phy", code.type = "AMINO_ACID")
##D write.fasta.format(aa.aid, "new.pony.aa.aid.phy", sep = ",")
##D write.fasta.format(aa.acode, "new.pony.aa.acode.fas")
##D 
##D # Amino acid in PAML
##D write.paml(aa.aid, "new.pony.aa.pam", code.type = "AMINO_ACID")
##D write.paml.format(aa.aid, "new.pony.aa.aid.pam", sep = ",")
##D write.paml.format(aa.acode, "new.pony.aa.acode.pam")
## End(Not run)



