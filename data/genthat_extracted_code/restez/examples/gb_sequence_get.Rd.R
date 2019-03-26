library(restez)


### Name: gb_sequence_get
### Title: Get sequence from GenBank
### Aliases: gb_sequence_get

### ** Examples

library(restez)
restez_path_set(filepath = tempdir())
demo_db_create(n = 5)
restez_connect()
(seq <- gb_sequence_get(id = 'demo_1'))
(seqs <- gb_sequence_get(id = c('demo_1', 'demo_2')))


# delete demo after example
db_delete(everything = TRUE)



