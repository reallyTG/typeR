library(vortexR)


### Name: collate_one_dat
### Title: Collate one local Vortex output file into a data.frame
### Aliases: collate_one_dat

### ** Examples

# Pacioni et al. example files. See ?pacioni for more details.
require(vortexRdata)
pac.dir <- system.file('extdata', 'pacioni', package='vortexRdata')
f <- file.path(pac.dir, 'Pacioni_et_al_ST_Classic(Base).stdat')
one.st.classic <- collate_one_dat(f, 3)



