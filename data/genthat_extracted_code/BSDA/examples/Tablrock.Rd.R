library(BSDA)


### Name: Tablrock
### Title: Ozone concentrations at Mt. Mitchell, North Carolina
### Aliases: Tablrock
### Keywords: datasets

### ** Examples


summary(Tablrock$ozone)
boxplot(Tablrock$ozone)
qqnorm(Tablrock$ozone)
qqline(Tablrock$ozone)
par(mar = c(5.1 - 1, 4.1 + 2, 4.1 - 2, 2.1))
boxplot(ozone ~ day, data = Tablrock, 
        horizontal = TRUE, las = 1, cex.axis = 0.7)
        par(mar = c(5.1, 4.1, 4.1, 2.1))
## Not run: 
##D library(ggplot2)
##D   ggplot2::ggplot(data = Tablrock, aes(sample = ozone)) + 
##D              geom_qq() + 
##D              theme_bw()
##D   ggplot2::ggplot(data = Tablrock, aes(x = as.factor(day), y = ozone)) + 
##D              geom_boxplot(fill = "pink") + 
##D              coord_flip() + 
##D              labs(x = "") + 
##D              theme_bw()
## End(Not run)




