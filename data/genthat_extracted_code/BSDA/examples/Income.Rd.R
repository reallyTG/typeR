library(BSDA)


### Name: Income
### Title: Percent change in personal income from 1st to 2nd quarter in
###   2000
### Aliases: Income
### Keywords: datasets

### ** Examples


Income$class <- cut(Income$percent_change, 
                    breaks = c(-Inf, 0.5, 1.0, 1.5, 2.0, Inf))
T1 <- xtabs(~class, data = Income)
T1
barplot(T1, col = "pink")   
## Not run: 
##D library(ggplot2)
##D DF <- as.data.frame(T1)
##D DF
##D ggplot2::ggplot(data = DF,  aes(x = class, y = Freq)) + 
##D            geom_bar(stat = "identity", fill = "purple") + 
##D            theme_bw()
## End(Not run)  




