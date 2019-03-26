library(listviewer)


### Name: jsonedit
### Title: View 'Lists' with "jsoneditor"
### Aliases: jsonedit

### ** Examples

   library(listviewer)

   # using the data from the jsoneditor simple example
   #  in R list form
   jsonedit(
     list(
       array = c(1,2,3)
       ,boolean = TRUE
       ,null = NULL
       ,number = 123
       ,object = list( a="b", c="d" )
       ,string = "Hello World"
     )
   )

   # jsonedit also works with a JSON string
   jsonedit(
     '{"array" : [1,2,3] , "boolean" : true, "null" : null, number = 123}'
   )

   # also works with most data.frames
   jsonedit( mtcars )

   # helpful interactive view of par
   jsonedit( par() )




