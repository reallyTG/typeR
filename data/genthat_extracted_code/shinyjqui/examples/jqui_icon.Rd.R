library(shinyjqui)


### Name: jqui_icon
### Title: Create a jQuery UI icon
### Aliases: jqui_icon

### ** Examples

jqui_icon('caret-1-n')

library(shiny)

# add an icon to an actionButton
actionButton('button', 'Button', icon = jqui_icon('refresh'))

# add an icon to a tabPanel
tabPanel('Help', icon = jqui_icon('help'))



