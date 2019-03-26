library(Seurat)


### Name: SampleUMI
### Title: Sample UMI
### Aliases: SampleUMI

### ** Examples

raw_data = as.matrix(x = pbmc_small@raw.data)
downsampled = SampleUMI(data = raw_data)
head(x = downsampled)




