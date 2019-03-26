library(dodgr)


### Name: dodgr_to_sf
### Title: dodgr_to_sf
### Aliases: dodgr_to_sf

### ** Examples

hw <- weight_streetnet (hampi)
nrow(hw) # 5,729 edges
xy <- dodgr_to_sf (hw)
dim (xy) # 764 edges; 14 attributes



