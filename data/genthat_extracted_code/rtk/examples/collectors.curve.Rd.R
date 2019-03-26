library(rtk)


### Name: collectors.curve
### Title: collectors.curve
### Aliases: collectors.curve

### ** Examples

require("rtk")
# Collectors Curve dataset should be broad and contain many samples (columns)
data       <- matrix(sample(x = c(rep(0, 15000),rep(1:10, 100)),
                     size = 10000, replace = TRUE), ncol = 80)
data.r     <- rtk(data, ReturnMatrix = 1, depth = min(colSums(data)))
# collectors curve on dataframe/matrix
collectors.curve(data, xlab = "No. of samples", ylab = "richness")
# same with rarefaction results (one matrix recommended)
collectors.curve(data.r, xlab = "No. of samples (rarefied data)", ylab = "richness")

# if you want to have an accumulated order, t compare various studies to one another:
cls          <- rep_len(c("a","b","c","d"), ncol(data))  # study origin of each sample
accumOrder   <- c("b","a","d","c")      # define the order, for the plot
colors       <- c(1,2,3,4)
names(colors) <- accumOrder # names used for legend
collectors.curve(data, xlab = "No. of samples",
                 ylab = "richness", col = colors, bin = 1,cls = cls, 
                 accumOrder = accumOrder)




