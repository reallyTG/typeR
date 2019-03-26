library(ggghost)


### Name: %g<%
### Title: Begin constructing a ggghost cache
### Aliases: %g<%

### ** Examples

## create a ggghost object
tmpdata <- data.frame(x = 1:100, y = rnorm(100))

z %g<% ggplot(tmpdata, aes(x,y))



