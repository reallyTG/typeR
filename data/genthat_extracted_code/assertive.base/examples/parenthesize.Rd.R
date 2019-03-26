library(assertive.base)


### Name: parenthesize
### Title: Wrap a string in brackets
### Aliases: parenthesise parenthesize

### ** Examples

paste("There were three", parenthesise(3), "mice in the experiment.")
paste(
  "I love parmos", 
  parenthesise("Teesside's finest culinary invention", "en_dashes"), 
  "but they are sure to give me heart disease."
)
parenthesise(letters[1:5], "curly")
paste0(
  "The R language", 
  parenthesise("an offshoot of S and Scheme", "commas"), 
  "is quite good for data analysis."
)



