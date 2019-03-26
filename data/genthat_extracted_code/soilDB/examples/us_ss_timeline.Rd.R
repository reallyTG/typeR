library(soilDB)


### Name: us_ss_timeline
### Title: Timeline of US Published Soil Surveys
### Aliases: us_ss_timeline
### Keywords: datasets

### ** Examples

## Not run: 
##D library(XML)
##D library(RCurl)
##D library(ggplot2)
##D 
##D data(state)
##D st <- paste0(c(state.abb, "PR", "DC", "VI", "PB"))
##D us_ss_timeline <- {
##D   lapply(st, function(x) {
##D     cat("getting", x, "\n")
##D     url <- getURL(paste0(
##D     "https://www.nrcs.usda.gov/wps/portal/nrcs/surveylist/soils/survey/state/?stateId=", x)
##D     )
##D     df  <- readHTMLTable(url, which = 22, stringsAsFactors = FALSE)
##D     df$state <- x
##D     return(df)
##D     }) ->.;
##D   do.call("rbind", .) ->.;
##D   names(.) <- c("ssa", "year", "pdf", "wss", "state")
##D   .[.$year != "current", ] ->.;
##D   }
##D us_ss_timeline <- within(us_ss_timeline, {
##D   ssa  = sapply(ssa, function(x) strsplit(x, "\r")[[1]][1])
##D   year = as.numeric(year)
##D   pdf  = ifelse(pdf == "Yes", TRUE, FALSE)
##D   wss  = NULL
##D   })
##D 
##D test <- as.data.frame(table(us_ss_timeline$year), stringsAsFactors = FALSE)
##D 
##D g1 <- ggplot(test, aes(x = as.numeric(Var1), y = Freq)) +
##D   geom_histogram(stat = "identity") + 
##D   xlab("Year") + 
##D   ylab("Count") +
##D   theme(aspect.ratio = 1) + 
##D   ggtitle("Number of Published \n US Soil Surveys by Year")
##D g2 <- ggplot(test, aes(x = as.numeric(Var1), y = cumsum(Freq))) +
##D   geom_histogram(stat = "identity") + 
##D   xlab("Year") + 
##D   ylab("Count") +
##D   theme(aspect.ratio = 1) +
##D   ggtitle("Cumulative Number of Published \n US Soil Surveys by Year")
##D gridExtra::grid.arrange(g1, g2, ncol = 2)
##D 
## End(Not run)


