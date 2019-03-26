library(SMITIDvisu)


### Name: timeLineProxy
### Title: timeLineProxy get an instance of a timeline
### Aliases: timeLineProxy

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
##D tlproxy <- timeLineProxy("timeline")
## End(Not run)



