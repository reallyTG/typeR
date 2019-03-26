library(CDM)


### Name: cdi.kli
### Title: Cognitive Diagnostic Indices based on Kullback-Leibler
###   Information
### Aliases: cdi.kli summary.cdi.kli
### Keywords: Item discrimination Cognitive diagnostic discrimination
###   summary

### ** Examples

#############################################################################
# EXAMPLE 1: Examples based on CDM::sim.dina
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

mod <- CDM::din( sim.dina, q.matrix=sim.qmatrix )
summary(mod)
  ##  Item parameters
  ##         item guess  slip   IDI rmsea
  ##  Item1 Item1 0.086 0.210 0.704 0.014
  ##  Item2 Item2 0.109 0.239 0.652 0.034
  ##  Item3 Item3 0.129 0.185 0.686 0.028
  ##  Item4 Item4 0.226 0.218 0.556 0.019
  ##  Item5 Item5 0.059 0.000 0.941 0.002
  ##  Item6 Item6 0.248 0.500 0.252 0.036
  ##  Item7 Item7 0.243 0.489 0.268 0.041
  ##  Item8 Item8 0.278 0.125 0.597 0.109
  ##  Item9 Item9 0.317 0.027 0.656 0.065

cmod <- CDM::cdi.kli( mod )

# attribute discrimination indices
round( cmod$attr_disc, 3 )
  ##      V1     V2     V3
  ##   1.966  2.506 11.169

# look at global item discrimination indices
round( cmod$glob_item_disc, 3 )
  ##  > round( cmod$glob_item_disc, 3 )
  ##  Item1 Item2 Item3 Item4 Item5 Item6 Item7 Item8 Item9
  ##  0.594 0.486 0.533 0.465 5.913 0.093 0.040 0.397 0.656

# correlation of IDI and global item discrimination
stats::cor( cmod$glob_item_disc, mod$IDI )
  ##  [1] 0.6927274

# attribute-specific item indices
round( cmod$attr_item_disc, 3 )
  ##           V1    V2    V3
  ##  Item1 0.648 0.648 0.000
  ##  Item2 0.000 0.530 0.530
  ##  Item3 0.581 0.000 0.581
  ##  Item4 0.697 0.000 0.000
  ##  Item5 0.000 0.000 8.870
  ##  Item6 0.000 0.140 0.000
  ##  Item7 0.040 0.040 0.040
  ##  Item8 0.000 0.433 0.433
  ##  Item9 0.000 0.715 0.715

## Note that attributes with a zero entry for an item
## do not differ from zero for the attribute specific item index



