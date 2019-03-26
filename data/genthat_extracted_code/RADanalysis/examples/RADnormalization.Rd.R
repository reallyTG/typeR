library(RADanalysis)


### Name: RADnormalization
### Title: Normalizes an abundance vector to the desired number of ranks.
### Aliases: RADnormalization

### ** Examples

data("gut_otu_table")
rads <- gut_otu_table
original_rad <- sort(rads[1,],decreasing = TRUE)
#removing zeros
original_rad <- original_rad[original_rad > 0]
plot(original_rad,ylim = c(1,max(original_rad)),log = "xy", xlab = "Rank",ylab = "Abundance",
     main = "RAD of first sample",pch = 19,type = "b",cex = 0.5)
print(paste("number of ranks present in the original rad is:",length(original_rad)))
norm_rad <- RADnormalization(input = rads[1,],max_rank = 500,average_over = 50)
points(x = norm_rad$norm_rad * sum(norm_rad$norm_rad_count[1,]) ,pch = 19,cex = 1, type = "l",
       col = "blue",lwd = 4)
points(x = norm_rad$norm_rad_count[1,],pch = 19,cex = 1, type = "l",col = "red",lwd = 3)
points(x = norm_rad$norm_rad_count[2,],pch = 19,cex = 1, type = "l",col = "green",lwd = 3)
legend("bottomleft",legend = c("Original RAD","possible norm rad","possible norm rad",
                               paste("nrad averaged over 50 realizations, times",
                               sum(norm_rad$norm_rad_count[1,]))),
       col = c("black","red","green","blue"),lwd = 2,bty = "n")



