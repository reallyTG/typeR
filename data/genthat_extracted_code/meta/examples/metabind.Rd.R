library(meta)


### Name: metabind
### Title: Combine meta-analysis objects
### Aliases: metabind

### ** Examples

data(Fleiss93cont)

# Add some (fictitious) grouping variables:
Fleiss93cont$age <- c(55, 65, 55, 65, 55)
Fleiss93cont$region <- c("Europe", "Europe", "Asia", "Asia", "Europe")

meta1 <- metacont(n.e, mean.e, sd.e,
                  n.c, mean.c, sd.c,
                  data = Fleiss93cont, sm = "MD")

mu1 <- update(meta1, byvar = age, bylab = "Age group")
mu2 <- update(meta1, byvar = region, bylab = "Region")

mb1 <- metabind(mu1, mu2)
mb1

forest(mb1)



