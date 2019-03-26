library(phyclust)


### Name: code2snp
### Title: Transfer Nucleotide Codes / nids and SNPs / sids
### Aliases: code2snp snp2code nid2sid sid2nid
### Keywords: programming

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # For codes
##D a.vector <- c("A", "C", "G", "-", "T")
##D code2snp(a.vector)
##D snp2code(code2snp(a.vector))
##D snp2code(code2snp(a.vector), half = FALSE)
##D 
##D # For ids
##D a.sid.vector <- c(0, 2, 1, 4, 3)
##D nid2sid(a.sid.vector)
##D sid2nid(nid2sid(a.sid.vector))
##D sid2nid(nid2sid(a.sid.vector), half = FALSE)
##D 
##D # Test list
##D a.list <- list(a, a)
##D code2snp(a.list)
##D snp2code(code2snp(a.list))
##D snp2code(code2snp(a.list), half = FALSE)
##D 
##D # Test matrix
##D a.matrix <- rbind(a, a)
##D code2snp(a.matrix)
##D snp2code(code2snp(a.matrix))
##D snp2code(code2snp(a.matrix), half = FALSE)
## End(Not run)



