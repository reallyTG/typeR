library(PowerTOST)


### Name: bib.CL
### Title: Design matrices of period balanced incomplete block designs
### Aliases: bib.CL

### ** Examples

# 4 treatments/doses, 3 periods
bib.CL(4, 3)
# gives 4 sequences
# to see this in Chow & Liu's coding
tmt <- c("R", "T1", "T2", "T3")
matrix(tmt[bib.CL(4, 3)], ncol=3)



