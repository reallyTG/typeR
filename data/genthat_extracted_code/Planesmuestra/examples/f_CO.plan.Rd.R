library(Planesmuestra)


### Name: f_CO.plan
### Title: Plot the OC Curve for a specific Dodge Romig acceptance sampling
###   plan results
### Aliases: f_CO.plan
### Keywords: OC beta

### ** Examples

r1<-f_dodge.romig.simple(N=2500,"AOQL", p=0.01)
f_CO.plan(r1$plan)



