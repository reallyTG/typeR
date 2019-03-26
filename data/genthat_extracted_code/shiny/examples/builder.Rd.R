library(shiny)


### Name: builder
### Title: HTML Builder Functions
### Aliases: a br builder code div em h1 h2 h3 h4 h5 h6 hr img p pre span
###   strong tags

### ** Examples

doc <- tags$html(
  tags$head(
    tags$title('My first page')
  ),
  tags$body(
    h1('My first heading'),
    p('My first paragraph, with some ',
      strong('bold'),
      ' text.'),
    div(id='myDiv', class='simpleDiv',
        'Here is a div with some attributes.')
  )
)
cat(as.character(doc))



