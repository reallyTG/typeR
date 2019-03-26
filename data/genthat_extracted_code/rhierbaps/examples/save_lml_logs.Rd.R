library(rhierbaps)


### Name: save_lml_logs
### Title: save_lml_logs
### Aliases: save_lml_logs

### ** Examples

snp.matrix <- load_fasta(system.file("extdata", "small_seqs.fa", package = "rhierbaps"))
hb.result <- hierBAPS(snp.matrix, max.depth=2, n.pops=20)
save_lml_logs(hb.result,  file.path(tempdir(), "output_file.txt"))




