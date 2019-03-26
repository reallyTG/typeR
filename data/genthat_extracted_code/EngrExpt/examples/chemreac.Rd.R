library(EngrExpt)


### Name: chemreac
### Title: Yield of a chemical reaction
### Aliases: chemreac
### Keywords: datasets

### ** Examples

str(chemreac)
dotplot(temp ~ yield | time, chemreac, groups = cat,
        strip = FALSE, strip.left = TRUE, type = c("p", "a"), layout = c(1,2),
        auto.key = list(space = "right", title = "Catalyst", lines = TRUE))
summary(fm1 <- lm(yield ~ (time + temp + cat)^3, chemreac))
summary(fm2 <- lm(yield ~ time * temp + cat, chemreac))



