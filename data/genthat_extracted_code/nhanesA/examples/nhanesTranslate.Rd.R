library(nhanesA)


### Name: nhanesTranslate
### Title: Display code translation information for the specified table.
### Aliases: nhanesTranslate

### ** Examples

nhanesTranslate('DEMO_B', c('DMDBORN','DMDCITZN'))
nhanesTranslate('BPX_F', 'BPACSZ', details=TRUE)
## No test: 
nhanesTranslate('BPX_F', 'BPACSZ', data=nhanes('BPX_F'))
## End(No test)



