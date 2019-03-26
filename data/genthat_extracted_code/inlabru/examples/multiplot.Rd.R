library(inlabru)


### Name: multiplot
### Title: Multiple ggplots on a page.
### Aliases: multiplot

### ** Examples

df = data.frame(x=1:10,y=1:10,z=11:20)
pl1 = ggplot(data = df) + geom_line(mapping = aes(x,y), color = "red")
pl2 = ggplot(data = df) + geom_line(mapping = aes(x,z), color = "blue")
multiplot(pl1,pl2, cols = 2)




