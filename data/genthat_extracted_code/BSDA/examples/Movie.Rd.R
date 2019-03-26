library(BSDA)


### Name: Movie
### Title: Moral attitude scale on 15 subjects before and after viewing a
###   movie
### Aliases: Movie
### Keywords: datasets

### ** Examples


qqnorm(Movie$differ)
qqline(Movie$differ)
shapiro.test(Movie$differ)
t.test(Movie$after, Movie$before, paired = TRUE, conf.level = 0.99)
wilcox.test(Movie$after, Movie$before, paired = TRUE)




