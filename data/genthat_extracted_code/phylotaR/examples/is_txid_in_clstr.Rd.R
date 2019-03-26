library(phylotaR)


### Name: is_txid_in_clstr
### Title: Is txid in cluster?
### Aliases: is_txid_in_clstr

### ** Examples

data(tinamous)
cid <- tinamous@cids[[1]]
clstr <- tinamous[[cid]]
sq <- tinamous[[clstr@sids[[1]]]]
txid <- sq@txid
# expect true
is_txid_in_clstr(phylota = tinamous, txid = txid, cid = cid)



