library(MAGNAMWAR)


### Name: PhyDataError
### Title: Phylogenetic Tree with Attached Bar Plot and Standard Error Bars
### Aliases: PhyDataError

### ** Examples


file <- system.file('extdata', 'muscle_tree2.dnd', package='MAGNAMWAR')
PhyDataError(file, pheno_data, mcl_mtrx, species_colname = 'Treatment', data_colname = 'RespVar',
 OG='OG5_126778', xlabel='TAG Content')




