library(htmltools)


### Name: builder
### Title: HTML Builder Functions
### Aliases: builder tags p h1 h2 h3 h4 h5 h6 a br div span pre code img
###   strong em hr

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



