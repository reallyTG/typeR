library(alakazam)


### Name: getSegment
### Title: Get Ig segment allele, gene and family names
### Aliases: getSegment getAllele getGene getFamily

### ** Examples

# Light chain examples
kappa_call <- c("Homsap IGKV1D-39*01 F,Homsap IGKV1-39*02 F,Homsap IGKV1-39*01",
                "Homsap IGKJ5*01 F")

getAllele(kappa_call)
getAllele(kappa_call, first=FALSE)
getAllele(kappa_call, first=FALSE, strip_d=FALSE)

getGene(kappa_call)
getGene(kappa_call, first=FALSE)
getGene(kappa_call, first=FALSE, strip_d=FALSE)

getFamily(kappa_call)
getFamily(kappa_call, first=FALSE)
getFamily(kappa_call, first=FALSE, collapse=FALSE)
getFamily(kappa_call, first=FALSE, strip_d=FALSE)

# Heavy chain examples
heavy_call <- c("Homsap IGHV1-69*01 F,Homsap IGHV1-69D*01 F", 
                "Homsap IGHD1-1*01 F", 
                "Homsap IGHJ1*01 F")

getAllele(heavy_call, first=FALSE)
getAllele(heavy_call, first=FALSE, strip_d=FALSE)

getGene(heavy_call, first=FALSE)
getGene(heavy_call, first=FALSE, strip_d=FALSE)

# Filtering non-localized genes
nl_call <- c("IGHV3-NL1*01,IGHV3-30-3*01,IGHV3-30*01", 
             "Homosap IGHV3-30*01 F,Homsap IGHV3-NL1*01 F",
             "IGHV1-NL1*01")
             
getAllele(nl_call, first=FALSE, omit_nl=TRUE)
getGene(nl_call, first=FALSE, omit_nl=TRUE)
getFamily(nl_call, first=FALSE, omit_nl=TRUE)




