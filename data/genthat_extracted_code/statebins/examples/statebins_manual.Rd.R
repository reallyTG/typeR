library(statebins)


### Name: statebins_manual
### Title: Create a new ggplot-based "statebin" chart for USA states
###   (manually colored)
### Aliases: statebins_manual

### ** Examples

## Not run: 
##D library(httr)
##D library(dplyr)
##D election_2012 <-
##D   GET("https://raw.githubusercontent.com/hrbrmstr/statebins/master/tmp/election2012.csv")
##D results <- read.csv(textConnection(content(election_2012, as="text")),
##D                     header=TRUE, stringsAsFactors=FALSE)
##D results <- results %>%
##D   mutate(color=ifelse(is.na(Obama), "#2166ac", "#b2182b")) %>%
##D   select(state, color)
##D results %>%
##D   statebins_manual(font_size=4,
##D       text_color = "white", labels=c("Romney", "Obama"),
##D       legend_position="right", legend_title="Winner")
## End(Not run)



