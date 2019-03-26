library(RDML)


### Name: RDML.SetFData
### Title: Sets fluorescence data vectors to 'RDML' object
### Aliases: RDML.SetFData

### ** Examples

## Not run: 
##D PATH <- path.package("RDML")
##D filename <- paste0(PATH, "/extdata/", "stepone_std.rdml")
##D cfx96 <- RDML$new(filename)
##D ## Use plotCurves function from the chipPCR package to 
##D ## get an overview of the amplification curves
##D library(chipPCR)
##D ## Extract all qPCR data 
##D tab <- cfx96$AsTable()
##D tab2 <- tab
##D tab2$run.id <- "cpp"
##D cfx96.qPCR <- cfx96$GetFData(tab)
##D cpp <- cbind(cyc = cfx96.qPCR[, 1],
##D  apply(cfx96.qPCR[, -1], 2, 
##D    function(y) CPP(x = cfx96.qPCR[, 1], y = y)$y.norm))
##D cfx96$SetFData(cpp, tab2)
##D library(ggplot2)
##D library(gridExtra)
##D cfx96.gg <- cfx96$GetFData(tab, long.table = TRUE)
##D cpp.gg <- cfx96$GetFData(tab2,
##D                          long.table = TRUE)
##D plot1 <- ggplot(cfx96.gg, aes(x = cyc, y = fluo,
##D                 group=fdata.name)) +
##D                  geom_line() +
##D                  ggtitle("Raw data")
##D plot2 <- ggplot(cpp.gg, aes(x = cyc, y = fluo,
##D                 group=fdata.name)) +
##D                  geom_line() +
##D                  ggtitle("CPP processed data")
##D grid.arrange(plot1, plot2, nrow=2)
## End(Not run)



