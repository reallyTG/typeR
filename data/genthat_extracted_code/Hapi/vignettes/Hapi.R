## ----installation github, eval=FALSE, message=FALSE, warning=FALSE-------
#  ### Install dependencies ahead
#  install.packages('devtools')
#  install.packages('HMM')
#  
#  devtools::install_github('Jialab-UCR/Hapi')

## ----install rlang, eval=FALSE, message=FALSE, warning=FALSE-------------
#  devtools::install_github("tidyverse/rlang", build_vignettes = TRUE)

## ----installation, eval=FALSE, message=FALSE, warning=FALSE--------------
#  install.packages('HMM')
#  
#  install.packages('Hapi_0.0.1.tar.gz', repos = NULL, type='source')

## ----load, eval=TRUE, message=FALSE, warning=FALSE-----------------------
library(Hapi)

## ----load data q, message=FALSE, warning=FALSE, eval=TRUE----------------
library(HMM)
#library(DT)

### load example data
data(gmt)
rownames(gmt) <- gmt$pos
head(gmt)


## ----automatic, message=FALSE, warning=FALSE, eval=TRUE------------------
### automatic haplotype phasing
hapOutput <- hapiAutoPhase(gmt = gmt, code = 'atcg')
head(hapOutput)

## ----convert, eval=TRUE, message=FALSE, warning=FALSE--------------------
### covert A/T/C/G to 0/1
hetDa <- gmt[,1:4]
ref <- hetDa$ref
alt <- hetDa$alt

gmtDa <- gmt[,-(1:4)]
gmtDa <- base2num(gmt = gmtDa, ref = ref, alt = alt)
head(gmtDa)


## ----error, message=TRUE, warning=FALSE, eval=TRUE-----------------------
### define HMM probabilities
hmm = initHMM(States=c("S","D"), Symbols=c("s","d"), 
            transProbs=matrix(c(0.99999,0.00001,0.00001,0.99999),2),
            emissionProbs=matrix(c(0.99,0.01,0.01,0.99),2), 
            startProbs = c(0.5,0.5))
hmm

### filter out genotyping errors
gmtDa <- hapiFilterError(gmt = gmtDa, hmm = hmm)

## ----frame, message=TRUE, warning=FALSE, eval=TRUE-----------------------
### select a subset of high-quality markers
gmtFrame <- hapiFrameSelection(gmt = gmtDa, n = 3) ###

## ----imputation, message=TRUE, warning=FALSE, eval=TRUE------------------
### imputation
imputedFrame <- hapiImupte(gmt = gmtFrame, nSPT = 2, allowNA = 0)
head(imputedFrame)

## ----draft, message=FALSE, warning=FALSE, eval=TRUE----------------------
### majority voting
draftHap <- hapiPhase(gmt = imputedFrame) ###
head(draftHap)

### check positions with cv-links
draftHap[draftHap$cvlink>=1,]


## ----filter cluster, message=FALSE, warning=FALSE, eval=TRUE-------------
### identification of clusters of cv-links
cvCluster <- hapiCVCluster(draftHap = draftHap, cvlink = 2)
cvCluster


### determine hetSNPs in small regions involving multiple cv-links
filter <- c()
for (i in 1:nrow(cvCluster)) {
    filter <- c(filter, which (rownames(draftHap) >= cvCluster$left[i] & 
        rownames(draftHap) <= cvCluster$right[i]))
}

length(filter)

### filter out hetSNPs in complex regions and infer new draft haplotypes
if (length(filter) > 0) {
    imputedFrame <- imputedFrame[-filter, ]
    draftHap <- hapiPhase(imputedFrame)
} 

## ----proofreading, message=TRUE, warning=FALSE, eval=TRUE----------------
finalDraft <- hapiBlockMPR(draftHap = draftHap, gmtFrame = gmtFrame, cvlink = 1)
head(finalDraft)

## ----assembly, message=TRUE, warning=FALSE, eval=TRUE--------------------
consensusHap <- hapiAssemble(draftHap = finalDraft, gmt = gmtDa)
head(consensusHap)


## ----assemble end, message=TRUE, warning=FALSE, eval=TRUE----------------
consensusHap <- hapiAssembleEnd(gmt = gmtDa, draftHap = finalDraft, 
                                consensusHap = consensusHap, k = 300)

### Haplotype 1
hap1 <- sum(consensusHap$hap1==0)
### Haplotype 2
hap2 <- sum(consensusHap$hap1==1)
### Number of unphased hetSNPs
hap7 <- sum(consensusHap$hap1==7)

### Accuracy
max(hap1, hap2)/sum(hap1, hap2)


## ----convert back, message=FALSE, warning=FALSE, eval=TRUE---------------
### find hetSNP overlaps
snp <- which(rownames(hetDa) %in% rownames(consensusHap))

ref <- hetDa$ref[snp]
alt <- hetDa$alt[snp]

### convert back to A/T/C/G
consensusHap <- num2base(hap = consensusHap, ref = ref, alt = alt)
head(consensusHap)

### output all the information
hapOutput <- data.frame(gmt[snp,], consensusHap)
head(hapOutput)

## ----single gamete, message=FALSE, warning=FALSE, eval=TRUE--------------
### load haplotypes in each gamete cell
data(gamete11)
head(gamete11)

### load chromosome information of the genome
data(hg19)
head(hg19)

## ----gamete view, message=FALSE, warning=FALSE, eval=FALSE---------------
#  ### view gamete cells
#  hapiGameteView(chr = hg19, hap = gamete11)

## ----identify crossovers, message=FALSE, warning=FALSE, eval=TRUE--------
### haplotypes
hap <- hapOutput[,10:11]
head(hap)

### gametes
gmt <- hapOutput[,5:9]
head(gmt)

### identify crossover
cvOutput <- hapiIdentifyCV(hap = hap, gmt = gmt)
cvOutput

## ----crossover, message=FALSE, warning=FALSE, eval=FALSE-----------------
#  ### load crossover table
#  data(crossover)
#  head(crossover)

## ----resolution, message=FALSE, warning=FALSE, eval=FALSE----------------
#  hapiCVResolution(cv = crossover)

## ----distance, message=FALSE, warning=FALSE, eval=FALSE------------------
#  hapiCVDistance(cv = crossover)

## ----map, message=FALSE, warning=FALSE, eval=FALSE-----------------------
#  hapiCVMap(chr = hg19, cv = crossover, step = 5)

## ----sessionInfo---------------------------------------------------------
sessionInfo()

