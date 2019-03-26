library(CA3variants)


### Name: print.CA3variants
### Title: Print of three-way correspondence analysis results
### Aliases: print.CA3variants
### Keywords: multivariate partition

### ** Examples

data(happy)
ris.ca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "CA3") 
print(ris.ca3)
ris.nsca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "NSCA3") 
print(ris.nsca3)
ris.oca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "OCA3",norder=3) 
print(ris.oca3)



