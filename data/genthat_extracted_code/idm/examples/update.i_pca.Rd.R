library(idm)


### Name: update.i_pca
### Title: Updates a Principal Component Analysis solution
### Aliases: update.i_pca

### ** Examples

data(segmentationData, package = "caret")
HCS = data.frame(scale(segmentationData[,-c(1:3)]))
names(HCS) = abbreviate(names(HCS), minlength = 5)
res_PCA = i_pca(HCS[1:200, ])
aa = seq(from = 201, to = nrow(HCS), by = 200)
aa[length(aa)] = nrow(HCS)+1
for (k in c(1:(length(aa)-1))){
     res_PCA = update(res_PCA, HCS[c((aa[k]):(aa[k+1]-1)),])
    }
#Static plot
plot(res_PCA, animation = FALSE)



