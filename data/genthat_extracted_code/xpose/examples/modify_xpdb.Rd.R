library(xpose)


### Name: modify_xpdb
### Title: Add, remove or rename variables in an xpdb
### Aliases: modify_xpdb mutate.xpose_data select.xpose_data
###   rename.xpose_data

### ** Examples

# Mutate columns
xpdb_ex_pk %>% 
 mutate(lnDV = log(DV), 
        sim_count = irep(ID), 
        .problem = 1) %>% 
 dv_vs_idv(aes(y = lnDV))
 
# Rename/select columns
xpdb_ex_pk %>% 
 select(ID:TAD, DV, EVID) %>% 
 rename(TSLD = TAD) %>% 
 dv_vs_idv(aes(x = TSLD))



