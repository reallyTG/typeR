library(ideq)


### Name: predict.dstm
### Title: Predict Method for DSTM Fits
### Aliases: predict.dstm

### ** Examples

data("ide_standard", "ide_locations")

# IDE example
mod_ide <- dstm_ide(ide_standard, ide_locations)
predict(mod_ide)
predict(mod_ide, K=4, return_thetas=TRUE)

# EOF example
mod_eof <- dstm_eof(ide_standard, n_samples=2)
predict(mod_eof, K=2, only_K=TRUE, burnin=1)



