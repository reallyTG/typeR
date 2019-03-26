library(phylotaR)


### Name: write_sqs
### Title: Write out sequences
### Aliases: write_sqs

### ** Examples

data('aotus')
# get sequences for a cluster and write out
random_cid <- sample(aotus@cids, 1)
sids <- aotus[[random_cid]]@sids
write_sqs(phylota = aotus, outfile = file.path(tempdir(), 'test.fasta'),
          sq_nm = 'my_gene', sid = sids)



