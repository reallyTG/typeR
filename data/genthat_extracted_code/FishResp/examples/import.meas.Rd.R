library(FishResp)


### Name: import.meas
### Title: Import Raw Data of Metabolic Rate Measurements
### Aliases: import.meas

### ** Examples

# Import raw data for standard and active metabolic
# rate measurements (SMR and AMR, respectively)

# if the data have been already loaded to R,
# skip the first line of the code:
data(info)
## Not run: 
##D SMR.path = system.file("extdata/stickleback/SMR_raw.txt.xz", package = "FishResp")
##D SMR.raw <- import.meas(file = SMR.path,
##D                        info.data = info,
##D                        logger = "AutoResp",
##D                        n.chamber = 4,
##D                        date.format = "DMY",
##D                        start.measure = "22:00:00",
##D                        stop.measure = "06:00:00",
##D                        plot.temperature = TRUE,
##D                        plot.oxygen = TRUE)
##D 
##D AMR.path = system.file("extdata/stickleback/AMR_raw.txt.xz", package = "FishResp")
##D AMR.raw <- import.meas(file = AMR.path,
##D                        info.data = info,
##D                        logger = "AutoResp",
##D                        n.chamber = 4,
##D                        date.format = "DMY",
##D                        plot.temperature = TRUE,
##D                        plot.oxygen = TRUE)
##D 
##D # an example for importing raw data recorded by 'Q-box Aqua'
##D qbox.path = system.file("extdata/qboxaqua/qboxaqua.csv", package = "FishResp")
##D RMR.raw <- import.meas(file = qbox.path,
##D                         info.data = info,
##D                         logger = "QboxAqua",
##D                         n.chamber = 1,
##D                         date.format = "DMY",
##D                         start.measure = "23:30:00",
##D                         stop.measure = "01:00:00",
##D                         set.date.time = "23/02/2014/23:30:22",
##D                         meas.to.wait = 200,
##D                         plot.temperature = TRUE,
##D                         plot.oxygen = TRUE)
## End(Not run)



