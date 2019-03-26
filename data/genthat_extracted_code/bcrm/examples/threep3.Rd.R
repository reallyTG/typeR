library(bcrm)


### Name: threep3
### Title: Calculate all possible trial pathways for the standard 3+3
###   design, together with their probability of occurring
### Aliases: threep3

### ** Examples

## What are the operating characteristics of a standard 3+3 design if we conside only the first 
## 12 doses of the dose-escalation cancer trial example as described in Neuenschwander et al 2008.
## Pre-defined doses
dose<-c(1,2.5,5,10,15,20,25,30,40,50,75,100)
## Pre-specified probabilities of toxicity
p.tox0<-c(0.010,0.015,0.020,0.025,0.030,0.040,0.050,0.100,0.170,0.300,0.400,0.500)

## Not run: 
##D design.threep3<-threep3(truep=p.tox0,start=1,dose=dose)
##D print(design.threep3)
##D plot(design.threep3)
## End(Not run)



