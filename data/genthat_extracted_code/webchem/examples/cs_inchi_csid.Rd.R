library(webchem)


### Name: cs_inchi_csid
### Title: Convert a InChI to CSID
### Aliases: cs_inchi_csid

### ** Examples

## No test: 
# might fail if API is not available
inchi <-  "InChI=1S/C17H19NO3/c1-18-7-6-17-10-3-5-13(20)16(17)21-15-12(19)4-
2-9(14(15)17)8-11(10)18/h2-5,10-11,13,16,19-20H,6-8H2,1H3/t10-,11+,13-,16-,17-/m0/s1"
# convert InChI to CSID
cs_inchi_csid(inchi)
## End(No test)



