library(OrgMassSpecR)


### Name: Digest
### Title: Predict Peptides Resulting from Enzymatic Digest
### Aliases: Digest

### ** Examples

## digest human serum albumin with 0 and 1 missed cleavages
Digest(example.sequence, missed = 1)

## digest human serum albumin with a phosphoserine at position 58
## and all methionines oxidized
modifiedHsaSequence <- strsplit(example.sequence, split = "")[[1]]
modifiedHsaSequence[58] <- "s"   # insert code for phosphoserine  
modifiedHsaSequence <- paste(modifiedHsaSequence, collapse = "")
Digest(modifiedHsaSequence, custom = list(code = c("s","M"), 
       mass = c(MonoisotopicMass(list(C=3, H=6, N=1, O=5, P=1)),
                MonoisotopicMass(list(C=5, H=9, N=1, O=2, S=1)))))
                
## digest human serum albumin with strict rules
Digest(example.sequence, enzyme = "trypsin.strict")



