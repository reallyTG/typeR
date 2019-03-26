library(StatMatch)


### Name: RANDwNND.hotdeck
### Title: Random Distance hot deck.
### Aliases: RANDwNND.hotdeck
### Keywords: nonparametric

### ** Examples


data(samp.A, samp.B, package="StatMatch") #loads data sets
?samp.A
?samp.B


# samp.A plays the role of recipient
# samp.B plays the role of donor
# find a donor in the in the same region ("area5") and with the same
# gender ("sex"), then only the closest k=20 donors in terms of 
# "age" are cnsidered and one of them is picked up at random

out.NND.1 <- RANDwNND.hotdeck(data.rec=samp.A, data.don=samp.B,
                              don.class=c("area5", "sex"), dist.fun="ANN",
                              match.vars="age", cut.don="exact", k=20)

# create the synthetic (or fused) data.frame:
# fill in "labour5" in A
fused.1 <- create.fused(data.rec=samp.A, data.don=samp.B,
                        mtc.ids=out.NND.1$mtc.ids, z.vars="labour5")
head(fused.1)

# weights ("ww") are used in selecting the donor in the final step

out.NND.2 <- RANDwNND.hotdeck(data.rec=samp.A, data.don=samp.B,
                              don.class=c("area5", "sex"), dist.fun="ANN",
                              match.vars="age", cut.don="exact", 
                              k=20, weight.don="ww")
fused.2 <- create.fused(data.rec=samp.A, data.don=samp.B,
                        mtc.ids=out.NND.2$mtc.ids, z.vars="labour5")
head(fused.2)

# find a donor in the in the same region ("area5") and with the same
# gender ("sex"), then only the donors with "age" <= to the age of the
# recipient are considered,
# then one of them is picked up at random

out.NND.3 <- RANDwNND.hotdeck(data.rec=samp.A, data.don=samp.B,
                              don.class=c("area5", "sex"), dist.fun="diff",
                              match.vars="age", cut.don="<=")

# create the synthetic (or fused) data.frame:
# fill in "labour5" in A
fused.3 <- create.fused(data.rec=samp.A, data.don=samp.B,
                        mtc.ids=out.NND.3$mtc.ids, z.vars="labour5")
head(fused.3)

# Example of Imputation of missing values
# introducing missing vales in iris
ir.mat <- iris
miss <- rbinom(nrow(iris), 1, 0.3)
ir.mat[miss==1,"Sepal.Length"] <- NA
iris.rec <- ir.mat[miss==1,-1]
iris.don <- ir.mat[miss==0,]

#search for NND donors
imp.NND <- RANDwNND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                            match.vars=c("Sepal.Width","Petal.Length", "Petal.Width"),
                            don.class="Species")

# imputing missing values
iris.rec.imp <- create.fused(data.rec=iris.rec, data.don=iris.don,
                             mtc.ids=imp.NND$mtc.ids, z.vars="Sepal.Length")

# rebuild the imputed data.frame
final <- rbind(iris.rec.imp, iris.don)





