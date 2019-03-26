library(vtable)


### Name: dftoHTML
### Title: Data Frame to HTML Function
### Aliases: dftoHTML

### ** Examples

df <- data.frame(var1 = 1:4,var2=5:8,var3=c('A','B','C','D'),
    var4=as.factor(c('A','B','C','C')),var5=c(TRUE,TRUE,FALSE,FALSE))
dftoHTML(df,out="browser")




