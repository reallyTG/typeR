library(shiny)


### Name: reactivePoll
### Title: Reactive polling
### Aliases: reactivePoll

### ** Examples

function(input, output, session) {

  data <- reactivePoll(1000, session,
    # This function returns the time that log_file was last modified
    checkFunc = function() {
      if (file.exists(log_file))
        file.info(log_file)$mtime[1]
      else
        ""
    },
    # This function returns the content of log_file
    valueFunc = function() {
      read.csv(log_file)
    }
  )

  output$dataTable <- renderTable({
    data()
  })
}



