library(RGCxGC)


### Name: m_prcomp
### Title: Multiway Principal Component Analysis
### Aliases: m_prcomp

### ** Examples


data(MTBLS579)
## No test: 
MTBLS579_mpca <- m_prcomp(MTBLS579)
print(MTBLS579_mpca)
scores(MTBLS579_mpca)
plot_loading(MTBLS579_mpca)
## End(No test)




