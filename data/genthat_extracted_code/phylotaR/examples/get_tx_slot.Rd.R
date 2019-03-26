library(phylotaR)


### Name: get_tx_slot
### Title: Get slot data for each taxon record
### Aliases: get_tx_slot

### ** Examples

data('aotus')
random_txid <- sample(aotus@txids, 1)
(get_tx_slot(phylota = aotus, txid = random_txid, slt_nm = 'scnm'))
# see list_taxrec_slots() for available slots
(list_taxrec_slots())



