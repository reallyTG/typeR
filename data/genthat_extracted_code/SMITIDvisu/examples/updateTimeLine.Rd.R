library(SMITIDvisu)


### Name: updateTimeLine
### Title: updateTimeLine
### Aliases: updateTimeLine

### ** Examples

## Not run: 
##D ## server.R
##D ## output server variable
##D output$timeline <- renderTimeLine({
##D          timeLine(data.frame(), "")
##D        })
##D ## ui.R
##D timeLineOutput("timeline")
##D ## server.R
##D timeLineProxy("timeline") %>% updateTimeLine(newtimeline, "newId")
## End(Not run)



