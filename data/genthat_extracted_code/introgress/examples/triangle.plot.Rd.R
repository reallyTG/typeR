library(introgress)


### Name: triangle.plot
### Title: Triangle Plot
### Aliases: triangle.plot

### ** Examples

## produce triangle plots
## load simulated data
## markers have fixed differences, with
## alleles coded as 'P1' and 'P2'
data(AdmixDataSim1)
data(LociDataSim1)

## use prepare.data to produce introgress.data
introgress.data<-prepare.data(admix.gen=AdmixDataSim1,
                              loci.data=LociDataSim1,
                              parental1="P1", parental2="P2",
                              pop.id=FALSE, ind.id=FALSE,
                              fixed=TRUE)

## estimate hybrid index
hi.index<-est.h(introgress.data=introgress.data,
                loci.data=LociDataSim1, fixed=TRUE, p1.allele="P1",
                p2.allele="P2")

## Estimate interspecific heterozygosity
int.het<-calc.intersp.het(introgress.data=introgress.data)

## make plot
triangle.plot(hi.index=hi.index, int.het=int.het, pdf=FALSE)



