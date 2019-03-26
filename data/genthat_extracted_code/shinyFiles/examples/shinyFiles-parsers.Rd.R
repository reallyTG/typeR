library(shinyFiles)


### Name: shinyFiles-parsers
### Title: Convert the output of a selection to platform specific path(s)
### Aliases: shinyFiles-parsers parseFilePaths parseDirPath parseSavePath

### ** Examples

## Not run: 
##D ui <- shinyUI(bootstrapPage(
##D   shinyFilesButton('files', 'File select', 'Please select a file', FALSE),
##D   verbatimTextOutput('rawInputValue'),
##D   verbatimTextOutput('filepaths')
##D ))
##D server <- shinyServer(function(input, output) {
##D   roots = c(wd='.')
##D   shinyFileChoose(input, 'files', roots=roots, filetypes=c('', 'txt'))
##D   output$rawInputValue <- renderPrint({str(input$files)})
##D   output$filepaths <- renderPrint({parseFilePaths(roots, input$files)})
##D })
##D 
##D runApp(list(
##D   ui=ui,
##D   server=server
##D ))
## End(Not run)




