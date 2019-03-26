library(vortexR)


### Name: collate_dat
### Title: Collate Vortex .dat or .stdat output files into one data.frame
### Aliases: collate_dat

### ** Examples

# Using Campbell et al. and Pacioni et al. example files.
# See ?pacioni and ?campbell for more details on example files.
require(vortexRdata)
camp.dir <- system.file('extdata', 'campbell', package='vortexRdata')
pac.dir <- system.file('extdata', 'pacioni', package='vortexRdata')

# Campbell example, project 'Starlingv3PopBased' (.dat)
starling <- collate_dat('Starlingv3PopBased', 10000,
            dir_in=camp.dir, save2disk=FALSE)

# Read data from all .stdat of the project 'Pacioni_et_al' and the ST scenario
#   'ST_Classic' and store the output in the object 'woylie.st.classic'
woylie.st.classic <- collate_dat('Pacioni_et_al', 3, scenario = 'ST_Classic',
                     dir_in = pac.dir, save2disk=FALSE)

# Save collated data as .Rda and .txt
## Not run: 
##D # Read data from all .stdat of the project 'Pacioni_et_al' and the ST scenario
##D #   'ST_Classic'. Store the output in the object 'woylie.st.classic' and save
##D #   to disk
##D woylie.st.classic <- collate_dat('Pacioni_et_al', 3, scenario = 'ST_Classic',
##D                      dir_in = pac.dir, save2disk=TRUE)
## End(Not run)



