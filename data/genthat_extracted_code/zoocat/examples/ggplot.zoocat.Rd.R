library(zoocat)


### Name: gmon_trans
### Title: Tools for plottin 'zoocat' objects with ggplot2
### Aliases: gmon_trans scale_x_gmon scale_y_gmon

### ** Examples

library(ggplot2)
df <- data.frame(month = gmon(-5:5), value = 1:11)
ggplot(df, aes(month, value)) + 
    geom_line() + geom_point() +
    scale_x_gmon()
    



