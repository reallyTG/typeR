library(monitoR)


### Name: viewSpec
### Title: Interactively View and Annotate Spectrograms
### Aliases: viewSpec
### Keywords: iplot

### ** Examples

data(survey)
viewSpec(survey)

## Not run: 
##D # Start a new annotation file
##D viewSpec(survey, annotate = TRUE)
##D 
##D # View previous annotations
##D data(survey_anno)
##D write.csv(survey_anno, "survey_anno.csv", row.names = FALSE)
##D viewSpec(survey, interactive = TRUE, annotate = TRUE, anno = "survey_anno.csv", start.time = 5)
##D 
##D # Disable consistent spectrograms
##D viewSpec(survey, interactive = TRUE, annotate = TRUE, page.length = 10, consistent = FALSE)
## End(Not run)


