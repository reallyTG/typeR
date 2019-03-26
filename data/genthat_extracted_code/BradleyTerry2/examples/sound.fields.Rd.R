library(BradleyTerry2)


### Name: sound.fields
### Title: Kousgaard (1984) Data on Pair Comparisons of Sound Fields
### Aliases: sound.fields
### Keywords: datasets

### ** Examples


##
##  Fit the Bradley-Terry model to data for flutes, using the simple 'add 0.5'
##  method to handle ties:
##
flutes.model <- BTm(cbind(win1.adj, win2.adj), field1, field2, ~ field,
                    id = "field",
                    subset = (instrument == "flute"),
                    data = sound.fields)
##
##  This agrees (after re-scaling) quite closely with the estimates given
##  in Table 3 of Kousgaard (1984):
##
table3.flutes <- c(-0.581, -1.039, 0.347, 0.205, 0.276, 0.347, 0.311, 0.135)
plot(c(0, coef(flutes.model)), table3.flutes)
abline(lm(table3.flutes ~ c(0, coef(flutes.model))))
##
##  Now re-parameterise that model in terms of the factorial effects, as
##  in Table 5 of Kousgaard (1984):
##
flutes.model.reparam <- update(flutes.model,
                               formula = ~ a[field] * b[field] * c[field]
			       )
table5.flutes <- c(.267, .250, -.088, -.294, .062, .009, -0.070)
plot(coef(flutes.model.reparam), table5.flutes)
abline(lm(table5.flutes ~ coef(flutes.model.reparam)))




