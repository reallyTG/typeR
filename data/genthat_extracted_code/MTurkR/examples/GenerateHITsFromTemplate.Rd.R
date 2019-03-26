library(MTurkR)


### Name: GenerateHITsFromTemplate
### Title: Generate HITs from a Template
### Aliases: GenerateHITsFromTemplate
### Keywords: HITs

### ** Examples

## Not run: 
##D # create/edit template HTML file
##D # should have placeholders of the form `${varName}` for variable values
##D temp <- system.file("templates/htmlquestion2.xml", package = "MTurkR")
##D readLines(temp)
##D 
##D # create/load data.frame of template variable values
##D a <- data.frame(hittitle = c("HIT title 1","HIT title 2","HIT title 3"),
##D                 hitvariable = c("HIT text 1","HIT text 2","HIT text 3"), 
##D                 stringsAsFactors=FALSE)
##D 
##D # create HITs from template and data.frame values
##D temps <- GenerateHITsFromTemplate(template = temp, input = a)
##D 
##D # create HITs from template
##D hittype1 <- RegisterHITType(title = "2 Question Survey",
##D               description = "Complete a 2-question survey",
##D               reward = ".20", 
##D               duration = seconds(hours=1), 
##D               keywords = "survey, questionnaire, politics")
##D hits <- lapply(temps, function(x) {
##D     CreateHIT(hit.type = hittype1$HITTypeId, 
##D               expiration = seconds(days = 1),
##D               assignments = 2,
##D               question = GenerateHTMLQuestion(x)$string)
##D })
##D 
##D # cleanup
##D ExpireHIT(hit.type = hittype1$HITTypeId)
##D DisposeHIT(hit.type = hittype1$HITTypeId)
## End(Not run)



