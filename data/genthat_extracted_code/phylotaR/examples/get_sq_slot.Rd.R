library(phylotaR)


### Name: get_sq_slot
### Title: Get slot data for each sequence
### Aliases: get_sq_slot

### ** Examples

data('aotus')
random_sid <- sample(aotus@sids, 1)
(get_sq_slot(phylota = aotus, sid = random_sid, slt_nm = 'dfln'))
# see list_seqrec_slots() for available slots
(list_seqrec_slots())



