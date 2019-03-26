library(spup)


### Name: render.character
### Title: Render method for "character" class.
### Aliases: render.character

### ** Examples


require(magrittr)
require(whisker)
# render character string
my_template <- "Hello {{name}}. How are you doing?"
my_template %>% 
  render(name = "Winnie the Pooh")

# render table      
my_template <- c(
     "| x | y |",
     "|---|---|",
     "{{#MY_TABLE}}",
     "| {{X}} | {{Y}} |",
     "{{/MY_TABLE}}")
my_table <- data.frame(X = 1:5, Y = letters[1:5])  
my_table
my_template %>% 
render(MY_TABLE = unname(rowSplit(my_table))) %>%
cat
  



