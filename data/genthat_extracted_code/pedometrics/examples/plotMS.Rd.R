library(pedometrics)


### Name: plotMS
### Title: Model series plot
### Aliases: plotMS
### Keywords: hplot

### ** Examples

# This example follows the discussion in section "Details"
# Note that the data.frame is created manually
id <- c(1:8)
design <- data.frame(a = c(0, 0, 1, 0, 1, 0, 1, 1),
                     b = c(0, 0, 0, 1, 0, 1, 1, 1),
                     c = c(0, 1, 0, 0, 1, 1, 0, 1))
adj_r2 <- c(0.87, 0.74, 0.81, 0.85, 0.54, 0.86, 0.90, 0.89)
obj <- cbind(id, design, adj_r2)
p <- plotMS(obj, grid = c(2:4), line = "adj_r2", ind = 1, 
            color = c("lightyellow", "palegreen"),
            main = "Model Series Plot")
print(p)




