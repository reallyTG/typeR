library(BSDA)


### Name: Music
### Title: Improvement scores for identical twins taught music recognition
###   by two techniques
### Aliases: Music
### Keywords: datasets

### ** Examples


qqnorm(Music$differ)
qqline(Music$differ)
shapiro.test(Music$differ)
t.test(Music$method1, Music$method2, paired = TRUE)
# Or
t.test(Music$differ)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Music, aes(x = differ)) + 
##D            geom_dotplot() + 
##D            theme_bw()
## End(Not run)




