library(RPPanalyzer)


### Name: plotTimeCourseII
### Title: Multiplot function for RPPA time course datasets
### Aliases: plotTimeCourseII
### Keywords: file

### ** Examples

## Not run: 
##D 
##D # pre-process the data
##D dataDir <- system.file("extdata", package="RPPanalyzer")
##D res <- dataPreproc(dataDir=dataDir, blocks=12, spot="aushon", exportNo=2)
##D # remove arrays
##D normdat_rm <- remove.arrays(res$normdat, param="target", arrays2rm=c("protein","blank"))
##D # select samples and export data
##D sel_sampels_A549 <- select.sample.group(normdat_rm, params=list("cell_line"="A549"), combine= FALSE)
##D write.Data(sel_sampels_A549, FileNameExtension="HGF_sample_data_A549")
##D # read selected data
##D dataexpression_1 <- read.table("HGF_sample_data_A549expression.txt")
##D # use getErrorModel function
##D dataexpression_2 <- getErrorModel(dataexpression_1, verbose=FALSE)
##D # use averageData function
##D dataexpression_3 <- averageData(dataexpression_2, scaling=c("slide","replicate"), 
##D distinguish=c("cell_line","treatment"))
##D # plot time course data
##D plotTimeCourseII(dataexpression_3, filename="timecourse_HGF_sample_data_A549.pdf", 
##D legpos="top", xname="time [min]",
##D yname="signal [a.u.]", linecolor=c("red","green","blue","black","orange","grey"))
##D 
## End(Not run)



