library(vortexR)


### Name: line_plot_year_mid
### Title: Line plots of Vortex parameters vs years
### Aliases: line_plot_year_mid

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
lineMidPlot.st.classic <- line_plot_year_mid(data=pac.clas,
                          project='Pacioni_et_al',
                          scenario='ST_Classic',
                          yrmid=50,
                          params=c('PExtinct', 'Nextant', 'Het', 'Nalleles'),
                          save2disk=FALSE)



