library(FrF2)


### Name: StructurePickers
### Title: Functions to find split-plot or left-adjusted designs
### Aliases: splitpick leftadjust
### Keywords: array design

### ** Examples

## leftadjusting MA design from table 6.22 in BHH2, 9 factors, 32 runs
## NOTE: nevertheless not as well left-adjusted as the isomorphic design 9-4.1 from catlg
leftadjust(5,c(30,29,27,23))
## with option early=4 (i.e. 4 columns as early as possible are requested)
leftadjust(5,c(30,29,27,23),early=4)
leftadjust(5,catlg$'9-4.1'$gen,early=4)

## look for a split plot design in 32 runs with 7 factors, 
##       3 of which are whole plot factors, 
##       and 8 plots
splitpick(5,catlg$'7-2.1'$gen,nfac.WP=3,k.WP=3)



