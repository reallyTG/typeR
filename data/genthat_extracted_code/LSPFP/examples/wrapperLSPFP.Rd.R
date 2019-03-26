library(LSPFP)


### Name: wrapperLSPFP
### Title: wrapperLSPFP
### Aliases: wrapperLSPFP
### Keywords: ~kwd1 ~kwd2

### ** Examples

#The download of gff-files and FASTA-sequences from UniProt 
# might be time consuming.
# Please consider this before running the example.

## Not run: 
##D #please choose a path
##D globpath <- getwd()
##D 
##D expname <- "Test_Mouse"
##D 
##D sourcefiles <- system.file("extdata", "Mouse.txt", 
##D                         package="LSPFPpackagetest")
##D 
##D org <- "Mouse"
##D 
##D 
##D #prepare grlocationdf
##D expnames <- c("Lysat_PB1a","Lysat_PB2a","Lysat_PB3a","Lysat_PB4a",
##D   "Lysat_PB5a","Lysat_PK1a", "Lysat_PK2a","Lysat_PK3a","Lysat_PK4a",
##D   "Lysat_PK5a","Sekretom_PB1a","Sekretom_PB2a","Sekretom_PB3a",
##D   "Sekretom_PB4a","Sekretom_PB5a","Sekretom_PK1a","Sekretom_PK2a",
##D   "Sekretom_PK3a","Sekretom_PK4a","Sekretom_PK5a")
##D 
##D # Are the values from the secretome or the proteome of the cells?
##D explocation <- c(rep("Proteome",10),rep("Secretome",10))
##D 
##D # Are the cells from the same culture eg. patient?
##D expsample <- c(rep(1:5,4))
##D 
##D # Are the samples differently treated? 
##D #(different environments, chemicals, tissue extraction technique)?
##D exptreatment <- c(rep("AA",5),rep("BB",5),rep("AB",5),rep("BC",5))
##D 
##D #Group specifies which experiments belong together
##D group <- c(rep(1,10),rep(2,10))
##D grlocationdf <- data.frame(Expname = expnames, Location = explocation, 
##D                           Treatment = exptreatment, Sample = expsample,
##D                           Group = group, stringsAsFactors = FALSE)
##D 
##D 
##D species <- "MOUSE"
##D proteomeid <- "UP000000589"
##D taxid <- "10090"
##D domain <- "Eukaryota"
##D 
##D 
##D res <- wrapperLSPFP(globpath, expname, sourcefiles, org, grlocationdf,
##D                     species= species, proteomeid = proteomeid,
##D                     taxid = taxid, domain = domain)
##D 
## End(Not run)



