library(sendplot)


### Name: eval.js
### Title: A JAVASCRIPT-LIKE EVAL FUNCTION
### Aliases: eval.js
### Keywords: methods

### ** Examples


df = list()
df$a = rep(1,5)
df$b = rep("one",5)
df = as.data.frame(df)

#for comparison view
df

eval.js("df$new = NA")
df

 



