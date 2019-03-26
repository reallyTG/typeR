library(MPV)


### Name: table.b11
### Title: Table B11
### Aliases: table.b11
### Keywords: datasets

### ** Examples

data(table.b11)
attach(table.b11)
Quality.lm <- lm(Quality ~ Clarity + Aroma + Body + Flavor + Oakiness + 
factor(Region))
summary(Quality.lm)
detach(table.b11)



