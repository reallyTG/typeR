### R code from vignette source 'MSIseq.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: NGStraindata
###################################################
library('MSIseq')
data(NGStraindata)
data(NGStestdata)
head(NGStraindata)


###################################################
### code chunk number 2: NGStrainseqLen
###################################################
data(NGStrainseqLen)
data(NGStestseqLen)
head(NGStrainseqLen)


###################################################
### code chunk number 3: Hg19repeats
###################################################
url <- 
"http://steverozen.net/data/Hg19repeats.rda"
file <- basename(url)
download.file(url, file)
load("Hg19repeats.rda")
head(Hg19repeats)


###################################################
### code chunk number 4: download
###################################################
## download the chromosome 20 sequence from UCSC
url2 <- 
"ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr20.fa.gz"
file <- basename(url2)
download.file(url2, file)
gunzip(file)
file <- 'chr20.fa'
## generate mono-nucleotide repeats regions from chromosome 20
data.chr20 = read.fasta(file)
mono.repeats.chr20 = find.mono.repeats(data.chr20)
names(mono.repeats.chr20)<-c('Chrom', 'Start_Position', 'End_Position')


###################################################
### code chunk number 5: NGStrainclass
###################################################
data(NGStrainclass)
head(NGStrainclass)


###################################################
### code chunk number 6: NGStraintype
###################################################
data(NGStraintype)
data(NGStesttype)
head(NGStraintype)


###################################################
### code chunk number 7: Compute.input.variables
###################################################
train.mutationNum<-Compute.input.variables(NGStraindata, 
          repeats = Hg19repeats, seq.len = NGStrainseqLen)


###################################################
### code chunk number 8: MSIseq.train
###################################################
sampleclassifier<-MSIseq.train(mutationNum = train.mutationNum, 
    classification=NGStrainclass, cancerType = NGStraintype)


###################################################
### code chunk number 9: sampleclassifier
###################################################
sampleclassifier


###################################################
### code chunk number 10: MSIseq.classify
###################################################
test.mutationNum<-Compute.input.variables(NGStestdata, 
              repeats = Hg19repeats, seq.len = NGStestseqLen)
result <- MSIseq.classify(mutationNum = test.mutationNum, 
              cancerType = NGStesttype)


###################################################
### code chunk number 11: result
###################################################
head(result)


