library(vortexR)


### Name: collate_run
### Title: Collate Vortex .run output files
### Aliases: collate_run

### ** Examples

# Using Pacioni et al. example files. See ?pacioni for more details.
pac.dir <- system.file('extdata', 'pacioni', package='vortexRdata')
# Run collate_run on all .run of the project 'Pacioni_et_al' and
run <- collate_run('Pacioni_et_al', 'ST_LHS', 1, dir_in=pac.dir,
                   save2disk=FALSE)



