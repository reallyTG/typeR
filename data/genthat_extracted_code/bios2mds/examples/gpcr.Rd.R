library(bios2mds)


### Name: gpcr
### Title: Pre-analyzed G-Protein-Coupled Receptor (GPCR) data set
### Aliases: gpcr
### Keywords: datasets

### ** Examples

# loading gpcr
data(gpcr)

# displaying the matrix of differences scores between GPCRs sequences
# from H. sapiens
gpcr$dif$sapiens.sapiens

# displaying the matrix of dissimilarity scores between GPCRs sequences
# from H. sapiens
gpcr$dis$sapiens.sapiens$PAM250

# displaying the matrix of dissimilarity scores between GPCRs sequences
# from H. sapiens and D. Melanogaster calculated with the BLOSUM45 matrix
gpcr$dis$melanogaster.sapiens$BLOSUM45

# displaying mmds analysis of the MSA of GPCRs from H. sapiens
# and D. Melanogaster
gpcr$mmds$sapiens.active
gpcr$mmds$melanogaster.project



