library(PASWR2)


### Name: LOSTR
### Title: Lost Revenue Due to Worker Illness
### Aliases: LOSTR
### Keywords: datasets

### ** Examples

ggplot(data = LOSTR, aes(x = numbersick, y = lostrevenue)) + geom_point(color = "red", 
pch = 21, fill = "pink", size = 4) + geom_smooth(method = "lm") + 
labs(x = "number of absent workers due to illness", y = "lost revenue in dollars")



