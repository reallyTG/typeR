library(dsa)


### Name: df2HTML
### Title: Output a dataframe to HTML
### Aliases: df2HTML

### ** Examples

a=data.frame(lapply(1:4, function(x) round(rnorm(10),2)))
colnames(a) = paste0("x", 1:4)
df2HTML(a, "out.html")



