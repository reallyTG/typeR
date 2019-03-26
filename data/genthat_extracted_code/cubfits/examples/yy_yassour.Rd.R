library(cubfits)


### Name: Yassour2009
### Title: Yassour 2009 Yeast Experiment Dataset
### Aliases: yassour
### Keywords: datasets

### ** Examples

## Not run: 
##D ### SD3.xls is available from the URL provided in the References.
##D da <- read.table("SD3.xls", header = TRUE, sep = "\t", quote = "",
##D                  stringsAsFactors = FALSE)
##D 
##D ### Select ORF, YPD0.1, YPD0.2, YPD15.1, YPD15.2.
##D da <- da[, c(1, 8, 9, 10, 11)]
##D colnames(da) <- c("ORF", "YPD0.1", "YPD0.2", "YPD15.1", "YPD15.2")
##D 
##D ### Drop inappropriate values (NaN, NA, Inf, -Inf, and 0).
##D tmp <- da[, 2:5]
##D id.tmp <- rowSums(is.finite(as.matrix(tmp)) & tmp != 0) >= 3
##D tmp <- da[id.tmp, 1:5]
##D yassour <- tmp[order(tmp$ORF),]    # cubfits::yassour
##D 
##D ### Get geometric mean of phi.Obs and scaling similar to Wallace (2013).
##D GM <- apply(yassour[, -1], 1, function(x) exp(mean(log(x[x != 0]))))
##D phi.Obs <- GM / sum(GM) * 15000
##D 
##D ### Get individual of phi.Obs.
##D GM <- apply(yassour[, -1], 1, function(x) exp(mean(log(x[x != 0]))))
##D phi.Obs.all <- yassour[, -1] / sum(GM) * 15000
##D phi.Obs.all[phi.Obs.all == 0] <- NA
## End(Not run)



