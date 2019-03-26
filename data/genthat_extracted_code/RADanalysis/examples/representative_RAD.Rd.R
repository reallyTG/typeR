library(RADanalysis)


### Name: representative_RAD
### Title: Computes representative normalized RAD of a group of normalized
###   RADs.
### Aliases: representative_RAD

### ** Examples

line_cols <- c("green","red","blue")
sample_classes <- c(1,1,1,1,2,2,3,3,1,1,2,3,3,1,1,2,3,3)
maxrank <- 400
data("gut_nrads")
nrads <- gut_nrads
nrads <- nrads$norm_matrix

#plot nrads
plot(1e10,xlim = c(1,maxrank),ylim = c(2e-5,1),log="xy",
     xlab = "rank",ylab = "abundance",cex.lab = 1.5,axes = FALSE)
sfsmisc::eaxis(side = 1,at = c(1,10,100,1000,10000))
sfsmisc::eaxis(side = 2,at = c(1e-4,1e-3,1e-2,1e-1,1),las = 0)
for(i in 1:nrow(nrads)){
    points(nrads[i,],type = 'l',col = line_cols[sample_classes[i]],lwd = 0.8)
}
#plot confidence intervals of representative nrads
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 1),
                      plot = TRUE,confidence = 0.9,with_conf = TRUE,
                      col = scales::alpha(line_cols[1],0.5),border = NA)
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 2),
                      plot = TRUE,confidence = 0.9,with_conf = TRUE,
                      col = scales::alpha(line_cols[2],0.5),border = NA)
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 3),
                      plot = TRUE,confidence = 0.9,with_conf = TRUE,
                      col = scales::alpha(line_cols[3],0.5),border = NA)
#plot representative nrads
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 1),
                      plot = TRUE,with_conf = FALSE,
                      col = scales::alpha(line_cols[1],0.8),lwd = 4)
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 2),
                      plot = TRUE,with_conf = FALSE,
                      col = scales::alpha(line_cols[2],0.8),lwd = 4)
a <- representative_RAD(norm_rad = nrads,sample_ids = which(sample_classes == 3),
                      plot = TRUE,with_conf = FALSE,
                      col = scales::alpha(line_cols[3],0.8),lwd = 4)
legend("bottomleft",bty = "n",legend = c("pre Cp","under Cp","post Cp"),
col = line_cols,lwd = 3)




