library(simFrame)


### Name: setNA
### Title: Set missing values
### Aliases: setNA setNA-methods setNA,data.frame,character-method
###   setNA,data.frame,missing-method setNA,data.frame,NAControl-method
###   setna SetNA Setna setna-methods SetNA-methods Setna-methods
### Keywords: manip methods

### ** Examples

data(eusilcP)
eusilcP$age[eusilcP$age < 0] <- 0  # this actually occurs
sam <- draw(eusilcP[, c("id", "age", "eqIncome")], size = 20)


## using control objects
# missing completely at random
mcarc <- NAControl(target = "eqIncome", NArate = 0.2)
setNA(sam, mcarc)

# missing at random
marc <- NAControl(target = "eqIncome", NArate = 0.2, aux = "age")
setNA(sam, marc)

# missing not at random
mnarc <- NAControl(target = "eqIncome", 
    NArate = 0.2, aux = "eqIncome")
setNA(sam, mnarc)


## supply slots of control object as arguments
# missing completely at random
setNA(sam, target = "eqIncome", NArate = 0.2)

# missing at random
setNA(sam, target = "eqIncome", NArate = 0.2, aux = "age")

# missing not at random
setNA(sam, target = "eqIncome", NArate = 0.2, aux = "eqIncome")



