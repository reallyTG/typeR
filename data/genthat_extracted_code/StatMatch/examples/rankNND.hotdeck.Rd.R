library(StatMatch)


### Name: rankNND.hotdeck
### Title: Rank distance hot deck method.
### Aliases: rankNND.hotdeck
### Keywords: nonparametric

### ** Examples


data(samp.A, samp.B, package="StatMatch") #loads data sets

# samp.A plays the role of recipient
?samp.A

# samp.B plays the role of donor
?samp.B


# rankNND.hotdeck()
# donation classes formed using "area5"
# ecdf conputed on "age"
# UNCONSTRAINED case
out.1 <- rankNND.hotdeck(data.rec=samp.A, data.don=samp.B, var.rec="age",
                         don.class="area5")
fused.1 <- create.fused(data.rec=samp.A, data.don=samp.B,
                        mtc.ids=out.1$mtc.ids, z.vars="labour5")
head(fused.1)

#  as before but ecdf estimated  using weights
# UNCONSTRAINED case
out.2 <- rankNND.hotdeck(data.rec=samp.A, data.don=samp.B, var.rec="age",
                         don.class="area5",
                         weight.rec="ww", weight.don="ww")
fused.2 <- create.fused(data.rec=samp.A, data.don=samp.B,
                        mtc.ids=out.2$mtc.ids, z.vars="labour5")
head(fused.2)




