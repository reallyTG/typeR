library(survutils)


### Name: get_c_stat
### Title: Calculate C-statistics
### Aliases: get_c_stat

### ** Examples

# Example taken from survC1
## Not run: 
##D library("survival")
##D in.df <- survC1::CompCase(pbc[1:200, c(2:4,10:14)])
##D in.df[, 2] <- as.numeric(in.df[,2]==2)
##D tau <- 365.25*8
##D prog.factor <- c("trt", "edema", "bili", "chol", "albumin", "copper")
##D get_c_stat(in.df, "time", "status", prog.factor, tau)
## End(Not run)



