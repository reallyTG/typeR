library(VCA)


### Name: varPlot
### Title: Variability Chart for Hierarchical Models.
### Aliases: varPlot

### ** Examples

## Not run: 
##D 
##D # load data (CLSI EP05-A2 Within-Lab Precision Experiment)
##D data(dataEP05A2_3)
##D 
##D # two additional classification variables (without real interpretation)
##D dataEP05A2_3$user <- sample(rep(c(1,2), 40))
##D dataEP05A2_3$cls2 <- sample(rep(c(1,2), 40))
##D 
##D # plot data as variability-chart, using automatically determined parameter 
##D # settings (see 'dynParmSet')
##D varPlot(y~day/run, dataEP05A2_3)
##D 
##D # display intercept (total mean)
##D varPlot(y~day/run, dataEP05A2_3, MeanLine=list(var="int"))
##D 
##D # use custom VC-names
##D varPlot(y~day/run, dataEP05A2_3, VCnam=list(text=c("_Day", "_Run")))
##D 
##D # re-plot now also indicating dayly means as blue horizontal lines
##D varPlot(y~day/run, dataEP05A2_3, MeanLine=list(var=c("day", "int"), col="blue"))
##D 
##D # now use variable-names in names of individual factor-levels and use a different 
##D # notation of the nesting structure
##D varPlot(y~day+day:run, dataEP05A2_3, useVarNam=TRUE)
##D 
##D # rotate names of 2nd VC
##D varPlot(y~day+day:run, dataEP05A2_3, useVarNam=TRUE, VarLab=list(list(font=2), list(srt=60)))
##D 
##D # use alternating backgrounds for each level of factor "day" 
##D # (top-level factor is default) 
##D # use a simplified model formula (NOTE: only valid for function 'varPlot')
##D varPlot(y~day+run, dataEP05A2_3, BG=list(col=c("lightblue", "lightgray"), border=NA))
##D 
##D # now also color the corresponding row in the table accordingly
##D varPlot( y~day+run, dataEP05A2_3, 
##D          BG=list(col=c("lightblue", "lightgray"), border=NA, col.table=TRUE))
##D 
##D # assign different point-colors according to a classification variable
##D # not part of the model (artificial example in this case)
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,7), VCnam=list(side=4),
##D          Points=list(col=list(var="user", col=c("red", "green"))) )
##D 
##D # always check order of factor levels before annotating
##D order(unique(dataEP05A2_3$user))
##D 
##D # add legend to right margin
##D legend.m(fill=c("green", "red"), legend=c("User 1", "User 2")
##D 
##D # assign different plotting symbols according to a classification
##D # variable not part of the model
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,7), VCnam=list(side=4), 
##D          Points=list(pch=list(var="user", pch=c(2, 8))) )
##D 
##D # add legend to right margin
##D legend.m(pch=c(8,2), legend=c("User 1", "User 2")
##D 
##D # assign custom plotting symbols by combining 'pch' and 'bg'
##D varPlot( y~day+day:run, dataEP05A2_3, 
##D          Points=list(pch=list(var="user", pch=c(21, 24)),
##D                      bg=list( var="user", bg=c("lightblue", "yellow"))) )
##D 
##D # assign custom plotting symbols by combining 'pch', 'bg', and 'cex'      
##D varPlot( y~day+day:run, dataEP05A2_3,                                    
##D          Points=list(pch=list(var="user", pch=c(21, 24)),                
##D                      bg =list(var="user", bg=c("lightblue", "yellow")),
##D                      cex=list(var="user",  cex=c(2,1))) )
##D 
##D # now combine point-coloring and plotting symbols
##D # to indicate two additional classification variables
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,10), 
##D          VCnam=list(side=4, cex=1.5),
##D          Points=list(col=list(var="user", col=c("red", "darkgreen")), 
##D                      pch=list(var="cls2", pch=c(21, 22)),
##D                      bg =list(var="user", bg =c("orange", "green"))) )
##D 
##D # add legend to (right) margin
##D  legend.m( margin="right", pch=c(21, 22, 22, 22), 
##D            pt.bg=c("white", "white", "orange", "green"), 
##D            col=c("black", "black", "white", "white"), 
##D            pt.cex=c(1.75, 1.75, 2, 2), 
##D            legend=c("Cls2=1", "Cls2=2", "User=2", "User=1"),
##D            cex=1.5)
##D 
##D # use magenta lines between each level of factor "run" 
##D varPlot(y~day/run, dataEP05A2_3, BG=list(var="run", border="magenta"))
##D 
##D # plot SDs for each run
##D varPlot(y~day+day:run, dataEP05A2_3, type=2)
##D 
##D # use CV instead of SD
##D varPlot(y~day/run, dataEP05A2_3, type=2, VARtype="CV")
##D 
##D # now plot variability-chart and SD-plot in one window
##D varPlot(y~day/run, dataEP05A2_3, type=3, useVarNam=TRUE)
##D 
##D # now further customize the plot
##D varPlot( y~day/run, dataEP05A2_3, BG=list(col=c("lightgray", "wheat")),
##D          YLabel=list(font=2, col="green", cex=1, text="Custom Y-Axis Label"),
##D          VCnam=list(col="red", font=4),
##D          VarLab=list(col="magenta", font=3, srt=0))
##D 
##D # create variability-chart of the example dataset in the CLSI EP05-A2 
##D # guidline (listed on p.25)
##D data(Glucose)
##D varPlot(result~day/run, Glucose, type=3)
##D 
##D # use individual settings of 'VarLab' and 'VSpace' for each variance component
##D varPlot(result~day/run, Glucose, type=3, 
##D         VarLab=list(list(srt=45, col="red", font=2), 
##D         list(srt=90, col="blue", font=3)), VSpace=c(.25, .75))
##D 
##D # set individual titles for both plot when 'type=3'
##D varPlot(	result~day/run, Glucose, type=3, 
##D          Title=list(list(main="Variability Chart"), 
##D          list(main="Plot of SD-Values")))
##D 
##D # more complex experimental design
##D data(realData)
##D Data <- realData[realData$PID == 1,]
##D varPlot(y~lot/calibration/day/run, Data, type=3)
##D 
##D # improve visual appearance of the plot
##D varPlot(y~lot/calibration/day/run, Data, type=3, keep.order=FALSE,
##D         BG=list(var="calibration", col=c("white", "lightgray")))
##D 
##D # add horizontal lines indicating mean-value for each factor-level of all variables
##D varPlot(y~lot/calibration/day/run, Data, type=3, keep.order=FALSE,
##D         BG=list(var="calibration", 
##D                 col=c("aquamarine","antiquewhite2","antiquewhite4",
##D                       "antiquewhite1","aliceblue","antiquewhite3",
##D                       "white","antiquewhite","wheat" ), 
##D                 col.table=TRUE),
##D         MeanLine=list(var=c("lot", "calibration", "day", "int"), 
##D                       col=c("orange", "blue", "darkgreen", "yellow"), 
##D                       lwd=c(2,2,2,2)))
##D 
##D # now also highlight bounds between factor levels of "lot" and "day" 
##D # as vertical lines and extend them into the table (note that each 
##D # variable needs its specific value for 'col.table')
##D varPlot(y~lot/calibration/day/run, Data, type=3, keep.order=FALSE,
##D         BG=list(var="calibration", 
##D                 col=c("aquamarine","antiquewhite2","antiquewhite4",
##D                       "antiquewhite1","aliceblue","antiquewhite3",
##D                       "white","antiquewhite","wheat" ), 
##D                  col.table=TRUE),
##D         MeanLine=list(var=c("lot", "calibration", "day", "int"), 
##D                       col=c("orange", "blue", "darkgreen", "yellow"), 
##D                       lwd=c(2,2,2,2)),
##D         VLine=list(var=c("lot", "day"), col=c("black", "skyblue1"),
##D                    lwd=c(2, 1), col.table=c(TRUE, TRUE)))
##D 
##D # one can use argument 'JoinLevels' to join factor-levels or a variable
##D # nested within a higher-level factor, 'VLine' is used to separate levels
##D # of variables "calibration" and "lot" with different colors
##D  varPlot(y~calibration/lot/day/run, Data, 
##D          BG=list(var="calibration", 
##D                  col=c("#f7fcfd","#e5f5f9","#ccece6","#99d8c9",
##D                        "#66c2a4","#41ae76","#238b45","#006d2c","#00441b"), 
##D                  col.table=TRUE), 
##D          VLine=list(var=c("calibration", "lot"), 
##D                     col=c("black", "darkgray"), lwd=c(2,1), col.table=TRUE), 
##D          JoinLevels=list(var="lot", col=c("#ffffb2","orangered","#feb24c"), 
##D                          lwd=c(2,2,2)), 
##D          MeanLine=list(var="lot", col="blue", lwd=2))
##D 
##D # same plot demonstrating additional features applicable via 'Points' 
##D  varPlot(y~calibration/lot/day/run, Data, 
##D          BG=list(var="calibration", 
##D                  col=c("#f7fcfd","#e5f5f9","#ccece6","#99d8c9",
##D                        "#66c2a4","#41ae76","#238b45","#006d2c","#00441b"), 
##D                  col.table=TRUE), 
##D          VLine=list(var=c("calibration", "lot"), 
##D                     col=c("black", "mediumseagreen"), lwd=c(2,1), 
##D                     col.table=c(TRUE,TRUE)), 
##D          JoinLevels=list(var="lot", col=c("lightblue", "cyan", "yellow"), 
##D                          lwd=c(2,2,2)), 
##D          MeanLine=list(var="lot", col="blue", lwd=2),
##D          Points=list(pch=list(var="lot", pch=c(21, 22, 24)), 
##D                      bg =list(var="lot", bg=c("lightblue", "cyan", "yellow")), 
##D                      cex=1.25))
##D 
##D # depict measurements as boxplots
##D datS5 <- subset(VCAdata1, sample==5)
##D varPlot(y~device/day, datS5, Boxplot=list()) 
##D 
##D # present points as jitter-plot around box-center
##D varPlot(	y~device/day, datS5, 
##D          Boxplot=list(jitter=1),
##D          Points=list(pch=16, 
##D 						col=list(var="run", col=c("blue", "red"))), 
##D 			Mean=list(col="black", cex=1, lwd=2)) 
##D legend( "topright", legend=c("run 1", "run 2"),
##D         fill=c("blue", "red"), box.lty=0, border="white")
## End(Not run)



