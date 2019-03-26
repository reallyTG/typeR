library(EdSurvey)


### Name: rebindAttributes
### Title: Copy Data Frame Attributes
### Aliases: rebindAttributes

### ** Examples

## Not run: 
##D require(dplyr)
##D PISA2012 <- readPISA(path = paste0(edsurveyHome, "PISA/2012"),
##D                      database = "INT",
##D                      countries = "ALB", verbose=TRUE)
##D ledf <- getData(data = PISA2012, varnames = c("cnt", "oecd", "w_fstuwt",
##D                                               "st62q04", "st62q11",
##D                                               "st62q13", "math"),
##D                 omittedLevels = FALSE, addAttributes = TRUE)
##D 
##D omittedLevels <- c('Invalid', 'N/A', 'Missing', 'Miss', 'NA', '(Missing)')
##D for (i in c("st62q04", "st62q11", "st62q13")) {
##D   ledf[,i] <- factor(ledf[,i], exclude=omittedLevels)
##D }
##D 
##D #after applying some dplyr functions, the "light.edsurvey.data.frame" becomes just "data.frame"
##D PISA2012_ledf <- ledf %>%        
##D   rowwise() %>% 
##D   mutate(avg_3 = mean(c(st62q04, st62q11, st62q13), na.rm = TRUE)) %>% 
##D   ungroup() %>%
##D   rebindAttributes(PISA2012) # could also be called with ledf
##D class(PISA2012_ledf) 
##D # again a light.edsurvey.data.frame
##D lma <- lm.sdf(math ~ avg_3,data=PISA2012_ledf)
##D summary(lma)
##D 
##D PISA2012_ledf <- ledf %>%        
##D   rowwise() %>% 
##D   mutate(avg_3 = mean(c(st62q04, st62q11, st62q13), na.rm = TRUE)) %>% 
##D   ungroup() %>%
##D   rebindAttributes(ledf) # return attributes and make a light.edsurvey.data.frame 
##D # again a light.edsurvey.data.frame
##D lma <- lm.sdf(math ~ avg_3,data=PISA2012_ledf)
##D summary(lma)
## End(Not run)



