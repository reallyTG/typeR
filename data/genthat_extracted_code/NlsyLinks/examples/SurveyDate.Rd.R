library(NlsyLinks)


### Name: SurveyDate
### Title: Dataset containing survey details for each subject, for each
###   year
### Aliases: SurveyDate
### Keywords: datasets

### ** Examples

library(NlsyLinks) #Load the package into the current R session.

summary(SurveyDate)
table(SurveyDate$SurveyYear, SurveyDate$SurveySource)
table(is.na(SurveyDate$AgeSelfReportYears), is.na(SurveyDate$AgeCalculateYears))

if( require(ggplot2) & require(plyr) ) {
  dsSourceYear <- plyr::count(SurveyDate, c("SurveyYear", "SurveySource"))
  dsSourceYear <- dsSourceYear[dsSourceYear$SurveySource != "NoInterview", ]
  
  ggplot(dsSourceYear, aes(x=SurveyYear, y=freq, color=SurveySource)) +
    geom_line(size=2) +
    geom_point(size=5, shape=21) +
    scale_color_brewer(palette = "Dark2") +
    theme_bw() +
    theme(legend.position=c(0,0), legend.justification=c(0,0))
    
  ggplot(SurveyDate, aes(x=AgeSelfReportYears, y=AgeCalculateYears)) +
    geom_abline() +
    geom_point(shape=21) +
    theme_bw() 
} 




