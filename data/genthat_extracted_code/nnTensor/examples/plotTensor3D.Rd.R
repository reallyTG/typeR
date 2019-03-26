library(nnTensor)


### Name: plotTensor3D
### Title: Plot function for visualization of tensor data structure
### Aliases: plotTensor3D
### Keywords: methods

### ** Examples

tensordata <- toyModel(model = "CP")

out <- NTF(tensordata, rank=3, algorithm="Beta-HALS", num.iter=2)

tmp <- tempdir()

png(filename=paste0(tmp, "/NTF.png"))
plotTensor3D(recTensor(out$S, out$A))
dev.off()



