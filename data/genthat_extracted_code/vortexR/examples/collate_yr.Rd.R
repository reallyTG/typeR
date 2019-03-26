library(vortexR)


### Name: collate_yr
### Title: Collate Vortex .yr output files
### Aliases: collate_yr

### ** Examples

# Using Pacioni et al. example files. See ?pacioni for more details.
pac.dir <- system.file('extdata', 'pacioni', package='vortexRdata')

# Run collate_yr on all .yr of project 'Pacioni_et_al' and the ST scenario
# 'ST_Classic' in the selected folder and store the result in 'yr.st.classic'
yr.st.classic <- collate_yr(project='Pacioni_et_al', scenario='ST_Classic',
                            dir_in = pac.dir, save2disk=FALSE)



