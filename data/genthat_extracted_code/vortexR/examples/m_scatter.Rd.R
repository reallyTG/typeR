library(vortexR)


### Name: m_scatter
### Title: Generates a matrix of scatter plots
### Aliases: m_scatter

### ** Examples

# Using Pacioni et al. example data. See ?pac.lhs for more details.
data(pac.lhs)
# Remove base scenario
pac.lhs.no.base <- pac.lhs[!pac.lhs$scen.name == 'ST_LHS(Base)', ]

# Get correct parameter values at year 0
lkup.ST_LHS <- lookup_table(
    data=pac.lhs.no.base, project='Pacioni_et_al',
    scenario='ST_LHS',
    pop='Population 1',
    SVs=c('SV1', 'SV2', 'SV3', 'SV4', 'SV5', 'SV6', 'SV7'),
    save2disk=FALSE)

scatter.plot <- m_scatter(
    data=pac.lhs.no.base[1:33],
    data_type='dat',
    lookup=lkup.ST_LHS,
    yr=120,
    popn=1,
    param='Nall',
    vs=c('SV1', 'SV2', 'SV3'),
    save2disk=FALSE)



