library(StatMatch)


### Name: NND.hotdeck
### Title: Distance Hot Deck method.
### Aliases: NND.hotdeck
### Keywords: nonparametric

### ** Examples



# reproduce the classical matching framework
lab <- c(1:15, 51:65, 101:115)
iris.rec <- iris[lab, c(1:3,5)]  # recipient data.frame 
iris.don <- iris[-lab, c(1:2,4:5)] #donor data.frame

# Now iris.rec and iris.don have the variables
# "Sepal.Length", "Sepal.Width"  and "Species"
# in common.
#  "Petal.Length" is available only in iris.rec
#  "Petal.Width"  is available only in iris.don

# Find the closest donors donors computing distance
# on "Sepal.Length" and "Sepal.Width"
# unconstrained case, Euclidean distance

out.NND.1 <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                         match.vars=c("Sepal.Length", "Sepal.Width") )

# create the synthetic data.set:
# fill in "Petal.Width" in iris.rec

fused.1 <- create.fused(data.rec=iris.rec, data.don=iris.don, 
                        mtc.ids=out.NND.1$mtc.ids, z.vars="Petal.Width") 


# Find the closest donors computing distance
# on "Sepal.Length", "Sepal.Width" and Species;
# unconstrained case, Gower's distance

out.NND.2 <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                         match.vars=c("Sepal.Length", "Sepal.Width", "Species"), 
                         dist.fun="Gower")


# find the closest donors using "Species" to form donation classes
# and "Sepal.Length" and "Sepal.Width" to compute distance;
# unconstrained case.

out.NND.3 <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                         match.vars=c("Sepal.Length", "Sepal.Width"),
                         don.class="Species")


# find the donors using "Species" to form donation classes
# and "Sepal.Length" and "Sepal.Width" to compute distance;
# constrained case, "Hungarian" algorithm

library(clue)
out.NND.4 <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                         match.vars=c("Sepal.Length", "Sepal.Width"),
                         don.class="Species", constrained=TRUE, 
                         constr.alg="Hungarian")

# Example of Imputation of missing values.
# Introducing missing values in iris
ir.mat <- iris
miss <- rbinom(nrow(iris), 1, 0.3)
ir.mat[miss==1,"Sepal.Length"] <- NA
iris.rec <- ir.mat[miss==1,-1]
iris.don <- ir.mat[miss==0,]

#search for NND donors
imp.NND <- NND.hotdeck(data.rec=iris.rec, data.don=iris.don,
                       match.vars=c("Sepal.Width","Petal.Length", "Petal.Width"),
                       don.class="Species")

# imputing missing values
iris.rec.imp <- create.fused(data.rec=iris.rec, data.don=iris.don, 
                             mtc.ids=imp.NND$mtc.ids, z.vars="Sepal.Length") 

# rebuild the imputed data.frame
final <- rbind(iris.rec.imp, iris.don)





