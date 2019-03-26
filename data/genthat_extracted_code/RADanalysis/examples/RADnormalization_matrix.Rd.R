library(RADanalysis)


### Name: RADnormalization_matrix
### Title: Normalizes an abundance table to the desired number of ranks
### Aliases: RADnormalization_matrix

### ** Examples

data("gut_otu_table")
rads <- gut_otu_table
#plot original rads
line_cols <- c("green","red","blue")
sample_classes <- c(1,1,1,1,2,2,3,3,1,1,2,3,3,1,1,2,3,3)
plot(1,xlim = c(1,2000),ylim = c(1,20000),col = "white",log  = "xy",
     xlab = "Rank",ylab = "Abundance",main = "Original RADs from antibiotic data set")
for(i in 1:nrow(rads)){
    temp <- sort(rads[i,],decreasing = TRUE)
    temp <- temp[temp>0]
    lines(x = temp,lwd = 2,col = line_cols[sample_classes[i]])
}
legend("bottomleft",bty = "n",legend = c("pre Cp","under Cp","post Cp"),col = line_cols,lwd = 3)


nrads <- RADnormalization_matrix(input = rads,max_rank = 400,average_over = 20,sample_in_row = TRUE)
nrads <- nrads$norm_matrix

plot(1,xlim = c(1,400),ylim = c(4e-5,1),col = "white",log  = "xy",
     xlab = "Rank",ylab = "Abundance",
     main = "NRADs from antibiotic data set with R = 400 \n with average_over = 20")
for(i in 1:nrow(nrads)){
    lines(x = nrads[i,],lwd = 2,col = line_cols[sample_classes[i]])
}
legend("bottomleft",bty = "n",legend = c("pre Cp","under Cp","post Cp"),col = line_cols,lwd = 3)



