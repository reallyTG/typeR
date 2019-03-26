library(BSDA)


### Name: Statisti
### Title: Test scores for two beginning statistics classes
### Aliases: Statisti
### Keywords: datasets

### ** Examples


boxplot(score ~ class, data = Statisti, col = "violet")
tapply(Statisti$score, Statisti$class, summary, na.rm = TRUE)
## Not run: 
##D library(dplyr)
##D dplyr::group_by(Statisti, class) %>%
##D  summarize(Mean = mean(score, na.rm = TRUE), 
##D            Median = median(score, na.rm = TRUE), 
##D            SD = sd(score, na.rm = TRUE),
##D            RS = IQR(score, na.rm = TRUE))
## End(Not run)




