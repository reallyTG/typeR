library(reproducer)


### Name: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments
### Title: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments
### Aliases: reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments

### ** Examples

rrData = reproduceTablesOfPaperMetaAnalysisForFamiliesOfExperiments()
xtable::xtable(rrData$MAStats)
xtable::xtable(rrData$ESdata)
# Report values for 3 papers that reported per document
rrData$MAStatsTP1=data.frame(rrData$MAStatsTP1,row.names=NULL)
rrData$ESTP1res=data.frame(rrData$ESTP1res,row.names=NULL)
xtable::xtable(rrData$MAStatsTP1)
xtable::xtable(rrData$ESTP1res)
# Report extra results for Study 8
xtable::xtable(rrData$GH2015extra)



