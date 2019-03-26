library(ggtern)


### Name: theme_rotate
### Title: Rotate Ternary Diagram
### Aliases: theme_rotate

### ** Examples

x = ggtern(data.frame(x=1,y=1,z=1),aes(x,y,z))
for(a in seq(0,60,by=15))
print(x + theme_rotate(a))



