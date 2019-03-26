library(EngrExpt)


### Name: defoam
### Title: Height of solution with defoamer
### Aliases: defoam
### Keywords: datasets

### ** Examples

str(defoam)
dotplot(pH ~ height|conc, defoam, groups = temp, aspect = 0.3,
        xlab = "Height of solution", type = c("p","a"),
        auto.key = list(space = "right", lines = TRUE,
                        title = "Temperature"),
        strip = FALSE, strip.left = TRUE,
        ylab = "pH within concentration")
summary(fm1 <- lm(height ~ (conc + pH + temp)^2, defoam))
summary(fm2 <- lm(height ~ (pH + temp)^3, defoam))



