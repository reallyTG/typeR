library(phylotaR)


### Name: get_clstr_slot
### Title: Get slot data for each cluster record
### Aliases: get_clstr_slot

### ** Examples

data('aotus')
random_cid <- sample(aotus@cids, 1)
(get_clstr_slot(phylota = aotus, cid = random_cid, slt_nm = 'seed'))
# see list_clstrrec_slots() for available slots
(list_clstrrec_slots())



