library(CNprep)


### Name: makeCNPmask
### Title: Given a set of copy-number events, create a DNA copy-number mask
### Aliases: makeCNPmask

### ** Examples

#load a table of copy number events collected from 1203 profiles.
data(cnpexample)
#Create a table of gain (amplification) events only.
amps<-cnpexample[cnpexample[,"copy.num"]=="amp",]
#Create a mask using this table.
ampCNPmask<-makeCNPmask(imat=amps,chromcol="chrom",startcol="chrom.start",
endcol="chrom.end",nprof=1203,uthresh=0.02,dthresh=0.008)



