library(EngrExpt)


### Name: wash
### Title: Appearance of washed and unwashed panels
### Aliases: wash
### Keywords: datasets

### ** Examples

str(wash)
summary(wash)
show(plt1 <- xyplot(time2 ~ time1, wash, groups = type,
       auto.key = list(columns = 2, lines = TRUE),
       aspect = "iso",
       type = c("g","p","smooth"),
       xlab  = "Initial rating",
       ylab = "Rating after 2 weeks",
       jitter.x = TRUE, jitter.y = TRUE))
tmd(plt1)
densityplot(~ I(time2 - time1), wash, groups = type,
            auto.key = list(columns = 2, lines = TRUE),
            xlab = "Change in rating after two weeks")



