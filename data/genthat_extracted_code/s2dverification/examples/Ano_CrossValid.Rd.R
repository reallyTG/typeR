library(s2dverification)


### Name: Ano_CrossValid
### Title: Computes Anomalies In Cross-Validation Mode
### Aliases: Ano_CrossValid
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
anomalies <- Ano_CrossValid(sampleData$mod, sampleData$obs)
PlotAno(anomalies$ano_exp, anomalies$ano_obs, startDates, 
        toptitle = paste('anomalies'), ytitle = c('K', 'K', 'K'), 
        legends = 'ERSST', biglab = FALSE, fileout = 'tos_ano_crossvalid.eps')



