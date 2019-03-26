library(dimRed)


### Name: KamadaKawai-class
### Title: Graph Embedding via the Kamada Kawai Algorithm
### Aliases: KamadaKawai-class KamadaKawai

### ** Examples

dat <- loadDataSet("Swiss Roll", n = 500)
kamada_kawai <- KamadaKawai()
kk <- kamada_kawai@fun(dat, kamada_kawai@stdpars)

plot(kk@data@data)





