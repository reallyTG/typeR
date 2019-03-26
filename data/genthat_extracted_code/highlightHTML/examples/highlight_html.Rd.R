library(highlightHTML)


### Name: highlight_html
### Title: Master highlight HTML function
### Aliases: highlight_html

### ** Examples

## No test: 
# Example of simple test table
# Change background color of table cells
library(highlightHTML)

# Setting path for example html files 
# To see path where these are saved, type file or file1 in the 
# r console.
file <- system.file('examples', 'bgtable.html', package = 'highlightHTML')

# Creating CSS tags to inject into HTML document
tags <- c("#bgred {background-color: #FF0000;}", 
  "#bgblue {background-color: #0000FF;}")
  
# Command to post-process HTML file - Writes to temporary file
highlight_html(input = file, output = tempfile(fileext = ".html"),  
  tags = tags, browse = FALSE)
  
# Change background color and text color with CSS
tags <- c("#bgred {background-color: #FF0000; color: white;}", 
  "#bgblue {background-color: #0000FF; color: white;}")
  
# Post-process HTML file
highlight_html(input = file, output = tempfile(fileext = ".html"),  
  tags = tags, update_css = TRUE, browse = TRUE, print = FALSE)

# By default the new file is opened in your default browser, here set to FALSE
highlight_html(input = file, output = tempfile(fileext = ".html"), 
  tags = tags, browse = FALSE, print = FALSE)
  
# Setting path for example html files 
# To see path where these are saved, type file or file1 in the 
# r console.
file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')

# Change background color and text color with CSS
tags <- c("#bgblack {background-color: black; color: white;}", 
  "#bgblue {background-color: #0000FF; color: white;}",
  "#colgreen {color: green;}")
  
# Post-process HTML file
highlight_html(input = file, output = tempfile(fileext = ".html"), 
  tags = tags, browse = TRUE)
  
# Use of render
file <- system.file('examples', 'mwe.md', package = 'highlightHTML')
tags <- c("#bgred {background-color: #FF0000; color: white;}",
   "#bgblue {background-color: #0000FF; color: white;}",
   "#bgblack {background-color: #000000; color: white;}",
   "#colgold {color: #FFD700;}")
highlight_html(input = file, output = tempfile(fileext = '.html'),
  tags = tags, browse = TRUE, render = TRUE)
## End(No test)
  



