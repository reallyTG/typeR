library(BSDA)


### Name: Habits
### Title: Study habits of students in two matched school districts
### Aliases: Habits
### Keywords: datasets

### ** Examples


shapiro.test(Habits$differ)
qqnorm(Habits$differ)
qqline(Habits$differ)
wilcox.test(Habits$B, Habits$A, paired = TRUE, alternative = "less")
t.test(Habits$signrks, alternative = "less")

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Habits, aes(x = differ)) + 
##D            geom_dotplot(fill = "blue") + 
##D            theme_bw()
## End(Not run)




