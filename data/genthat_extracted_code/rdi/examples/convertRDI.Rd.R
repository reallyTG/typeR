library(rdi)


### Name: convertRDI
### Title: Convert RDI measures
### Aliases: convertRDI

### ** Examples


#create genes
genes = sample(letters, 10000, replace=TRUE)
#create sequence annotations
seqAnnot = data.frame(donor = sample(1:4, 10000, replace=TRUE))
#calculate RDI
d = rdi(genes, seqAnnot)

##convert RDI to actual 'lfc' estimates and compare
dtrue = convertRDI(d)$pred
plot(d, dtrue)

##look at SD ranges around lfc estimates
dtrue = convertRDI(d, calcSD=TRUE)

##plot using ggplot2
library(ggplot2)
x = as.numeric(d)
y = as.numeric(dtrue$pred)
sd = as.numeric(dtrue$sd)
qplot(x,y)+geom_errorbar(aes(x=x, ymin=y-sd, ymax=y+sd))




