library(abcdeFBA)


### Name: BYPASS_REACTIONS_SUBSTRATE
### Title: BYPASS_REACTIONS_SUBSTRATE, to find the influx and efflux
###   reactions available to a particular metabolite/substrate
### Aliases: BYPASS_REACTIONS_SUBSTRATE 'bypass reactions for metabolites'
###   'alternative pathways'

### ** Examples

#To find the Bypass Reactions for a Substrate
data(Ecoli_core)	
ATP_prod_consump<-BYPASS_REACTIONS_SUBSTRATE(17,Ecoli_core)



