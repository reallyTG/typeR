library(EngrExpt)


### Name: adhesion
### Title: Adhesive qualities of a lens coating
### Aliases: adhesion adhesion2
### Keywords: datasets

### ** Examples

str(adhesion)
xtabs(~ pH, adhesion)
xyplot(adhesion ~ pH, adhesion,
       ylab = "Adhesion of a lens coating", xlab = "pH",
       type = c("g", "p", "a"))
dotplot(as.factor(pH) ~ adhesion, adhesion, ylab = "pH",
        type = c("p","a"), xlab = "Adhesion of a lens coating")
str(adhesion2)
xtabs(~ cat + pH, adhesion2)
dotplot(as.factor(pH) ~ adhesion, adhesion2, groups = cat,
        type = c("p","a"), ylab = "pH",
        auto.key = list(space = "right", lines = TRUE,
                        title = "Catalyst"))



