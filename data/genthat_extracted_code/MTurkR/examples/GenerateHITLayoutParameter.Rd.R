library(MTurkR)


### Name: GenerateHITLayoutParameter
### Title: Generate a HITLayout Parameter
### Aliases: GenerateHITLayoutParameter
### Keywords: HITs

### ** Examples

## Not run: 
##D # examples of specifying 'names' and 'values'
##D a <- GenerateHITLayoutParameter(names = "hitvariable", 
##D                                 values = "Text for HIT 1")
##D b <- GenerateHITLayoutParameter(names = "hitvariable", 
##D                                 values = "Text for HIT 2")
##D c <- GenerateHITLayoutParameter(names = c("hitvariable1","hitvariable2"),
##D                                 values = c("Headline for HIT1","Text for HIT 1"))
##D 
##D # example using a named character string in lieu of specifying 'names'
##D d <- GenerateHITLayoutParameter(values = c(hitvariable1 = "Headline for HIT1", 
##D                                            hitvariable2 = "Text for HIT 1"))
##D 
##D # create HIT using layout parameter
##D hit1 <- 
##D CreateHIT(title = "Survey",
##D           description = "5 question survey",
##D           reward = ".10",
##D           expiration = seconds(days=4),
##D           duration = seconds(hours = 1),
##D           keywords = "survey, questionnaire",
##D             # retrieved from MTurk web interface:
##D           hitlayoutid = "23ZGOOGQSCM61T1H5H9U0U00OQWFFU", 
##D           hitlayoutparameters = a)
##D 
##D # cleanup
##D DisableHIT(hit1$HITId)
## End(Not run)



