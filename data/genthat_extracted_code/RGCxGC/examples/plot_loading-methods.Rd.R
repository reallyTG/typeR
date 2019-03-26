library(RGCxGC)


### Name: plot_loading
### Title: Plot two dimensional loadings from MPCA
### Aliases: plot_loading plot_loading,MPCA-method

### ** Examples


library(colorRamps)
data(MTBLS579)
# MPCA with mean-centered and scaled data
MTBLS579_mpca <- m_prcomp(MTBLS579)
# Negative loadings of the first principal component
## No test: 
plot_loading(MTBLS579_mpca, type = "n", pc = 1,
             color.palette = matlab.like)
# Positive loadings of the first principal component
plot_loading(MTBLS579_mpca, type = "p", pc = 1,
             color.palette = matlab.like)
## End(No test)



