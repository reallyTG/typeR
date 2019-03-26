library(vortexR)


### Name: lookup_table
### Title: Summary table of simulation parameters
### Aliases: lookup_table

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
lkup.st.classic <- lookup_table(data=pac.clas, project='Pacioni_et_al',
                   scenario='ST_Classic', pop='Population 1',
                   SVs=c('SV1', 'SV2', 'SV3', 'SV4', 'SV5', 'SV6', 'SV7'),
                   save2disk=FALSE)



