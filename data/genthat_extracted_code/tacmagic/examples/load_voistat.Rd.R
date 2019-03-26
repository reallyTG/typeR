library(tacmagic)


### Name: load_voistat
### Title: Reads PMOD .voistat files and optionally merges volume-weighted
###   ROIs
### Aliases: load_voistat

### ** Examples

f <- system.file("extdata", "AD06_BPnd_BPnd_Logan.voistat", 
                 package="tacmagic")
vs <- load_voistat(f, ROI_def=roi_ham_pib(), model="Logan")



