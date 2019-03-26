library(CA3variants)


### Name: plot.CA3variants
### Title: Graphical display resulting from 'CAvariants3'
### Aliases: plot.CA3variants
### Keywords: graphical display interactive plot interactive biplot

### ** Examples

data(happy)
ris.ca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "CA3") 
plot(ris.ca3)
ris.nsca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "NSCA3") 
plot(ris.nsca3)
ris.oca3<-CA3variants(happy,p=2,q=2,r=2, ca3type = "OCA3",norder=3) 
plot(ris.oca3)



