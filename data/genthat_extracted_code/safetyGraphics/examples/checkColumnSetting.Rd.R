library(safetyGraphics)


### Name: checkColumnSetting
### Title: Check that a setting parameter has a matching data column
### Aliases: checkColumnSetting

### ** Examples

testSettings<-generateSettings(standard="AdAM")
testSettings$filters<-list()
testSettings$filters[[1]]<-list(value_col="RACE",label="Race")
testSettings$filters[[2]]<-list(value_col=NULL,label="No Column")
testSettings$filters[[3]]<-list(value_col="NotAColumn",label="Invalid Column")

#pass ($valid == TRUE)
safetyGraphics:::checkColumnSetting(key=list("id_col"),
                                    settings=testSettings, adlbc) 
                                    
#pass
safetyGraphics:::checkColumnSetting(key=list("filters",1,"value_col"),
                                    settings=testSettings, adlbc) 
                                    
#NULL column pass
safetyGraphics:::checkColumnSetting(key=list("filters",2,"value_col"),
                                    settings=testSettings, adlbc) 
                                    
#invalid column fails
safetyGraphics:::checkColumnSetting(key=list("filters",3,"value_col"),
                                    settings=testSettings, adlbc) 



