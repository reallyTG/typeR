library(EngrExpt)


### Name: computer
### Title: Repair time of computers
### Aliases: computer
### Keywords: datasets

### ** Examples

str(computer)
dotplot(type ~ time, computer, groups = brand,
        auto.key = list(columns = 3, lines = TRUE),
        type = c("p","a"), jitter.y = TRUE,
        xlab = "Time to repair computer (minutes)")
summary(fm1 <- lm(time ~ brand * type, computer))
summary(fm2 <- lm(time ~ brand + type, computer))
summary(fm3 <- lm(time ~ type, computer))



