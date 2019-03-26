library(staRdom)


### Name: eem_spectral_cor
### Title: Multiply EEMs with spectral correction vectors (Emission and
###   Excitation)
### Aliases: eem_spectral_cor

### ** Examples

eems <- system.file("extdata/EEMs",package="staRdom")
eem_list <- eem_read_csv(eems)

excorfile <- system.file("extdata/CorrectionFiles/xc06se06n.csv",package="staRdom")
Excor <- data.table::fread(excorfile)
emcorfile <- system.file("extdata/CorrectionFiles/mcorrs_4nm.csv",package="staRdom")
Emcor <- data.table::fread(emcorfile)

# adjust range of EEMs to cover correction vectors
eem_list <- eem_range(eem_list,ex = range(Excor[,1]), em = range(Emcor[,1]))

eem_list_sc <- eem_spectral_cor(eem_list,Excor,Emcor)



