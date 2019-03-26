library(tacmagic)


### Name: split_pvc
### Title: Subset PMOD tacs with or without PVC
### Aliases: split_pvc

### ** Examples

# f_raw_tac and f_raw_vol are the filenames of PMOD-generated files
f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 

tac <- load_tac(f_raw_tac)
tac_pvc <- split_pvc(tac, TRUE)
tac_nc <- split_pvc(tac, FALSE)



