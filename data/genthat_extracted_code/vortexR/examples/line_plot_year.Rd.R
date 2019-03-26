library(vortexR)


### Name: line_plot_year
### Title: Line plots of Vortex parameters vs years
### Aliases: line_plot_year

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
lineplot.st.classic <- line_plot_year(data=pac.clas, project='Pacioni_et_al',
                       scenario='ST_Classic',
                       params=c('PExtinct', 'Nextant', 'Het', 'Nalleles'),
                       save2disk=FALSE)



