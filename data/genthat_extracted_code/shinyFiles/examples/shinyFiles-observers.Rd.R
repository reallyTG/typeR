library(shinyFiles)


### Name: shinyFiles-observers
### Title: Create a connection to the server side filesystem
### Aliases: shinyFiles-observers shinyFileChoose shinyDirChoose
###   shinyFileSave

### ** Examples

## Not run: 
##D # File selections
##D ui <- shinyUI(bootstrapPage(
##D   shinyFilesButton('files', 'File select', 'Please select a file', FALSE)
##D ))
##D server <- shinyServer(function(input, output) {
##D   shinyFileChoose(input, 'files', roots=c(wd='.'), filetypes=c('', 'txt'),
##D                   defaultPath='', defaultRoot='wd')
##D })
##D 
##D runApp(list(
##D   ui=ui,
##D   server=server
##D ))
## End(Not run)

## Not run: 
##D # Folder selections
##D ui <- shinyUI(bootstrapPage(
##D   shinyDirButton('folder', 'Folder select', 'Please select a folder', FALSE)
##D ))
##D server <- shinyServer(function(input, output) {
##D   shinyDirChoose(input, 'folder', roots=c(wd='.'), filetypes=c('', 'txt'))
##D })
##D 
##D runApp(list(
##D   ui=ui,
##D   server=server
##D ))
## End(Not run)

## Not run: 
##D # File selections
##D ui <- shinyUI(bootstrapPage(
##D   shinySaveButton('save', 'Save', 'Save as...')
##D ))
##D server <- shinyServer(function(input, output) {
##D   shinyFileSave(input, 'save', roots=c(wd='.'))
##D })
##D 
##D runApp(list(
##D   ui=ui,
##D   server=server
##D ))
## End(Not run)




