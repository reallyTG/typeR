library(dfConn)


### Name: MLPB_boot
### Title: Multivariate Linear Process Bootstrap Method
### Aliases: MLPB_boot
### Keywords: bootstarpping

### ** Examples

## Don't show: 
# Load sample data
data(fMRI_dataList_shrinked)
MLPB_boot(fMRI_dataList_shrinked, output_dir=tempdir(), rois = 1:2, timepoints = 5, window_size=5)
rm(list=c('fMRI_dataList_shrinked'))
gc()
## End(Don't show)
## No test: 

# Load sample data

data(fMRI_dataList)

MLPB_boot(fMRI_dataList, output_dir = tempdir(), 
          rois = c(54,191,235), 
          timepoints = 750)
## End(No test)




