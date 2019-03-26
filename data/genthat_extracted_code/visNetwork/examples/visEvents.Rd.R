library(visNetwork)


### Name: visEvents
### Title: Network visualization events
### Aliases: visEvents

### ** Examples


nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

visNetwork(nodes, edges) %>%
 visEvents(select = "function(properties) {
     alert('selected nodes: ' + properties.nodes);}", 
     dragEnd = "function(properties) {
     alert('finish to drag');}")

# set one 
visNetwork(nodes, edges) %>%
 visEvents(type = "once", select = "function() {
     alert('first selection');}") %>%
 visEvents(select = "function(properties) {
     alert('selected nodes: ' + properties.nodes);}", 
     dragEnd = "function(properties) {
     alert('finish to drag');}")
      
# use this to get the network
visNetwork(nodes, edges) %>%
  visEvents(type = "once", startStabilizing = "function() {
            this.moveTo({scale:0.1})}") %>%
  visPhysics(stabilization = FALSE)

# shift+click, .....
visNetwork(nodes, edges) %>%
    visEvents(click = "function(e) {
            if(e.event.srcEvent.shiftKey){
              alert('shift+click event')
            } else if(e.event.srcEvent.ctrlKey){
              alert('ctrl+click event')
            }else if(e.event.srcEvent.altKey){
              alert('alt+click event')
            } else {
              alert('click event')
            }
          }")
          



