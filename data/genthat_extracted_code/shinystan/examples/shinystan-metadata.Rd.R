library(shinystan)


### Name: shinystan-metadata
### Title: View or change metadata associated with a 'shinystan' object
### Aliases: shinystan-metadata sso_info model_code notes model_name

### ** Examples

# use eight_schools example object
sso <- eight_schools

################
### sso_info ###
################

sso_info(sso)

##################
### model_code ###
##################

# view model code in example shinystan object 'eight_schools'
cat(model_code(sso))

# change the model code in sso 
# some jags style code
my_code <- "
 model {
   for (i in 1:length(Y)) {
     Y[i] ~ dpois(lambda[i])
     log(lambda[i]) <- inprod(X[i,], theta[])
   }
   for (j in 1:J) {
     theta[j] ~ dt(0.0, 1.0, 1.0)
   }
 }
"
sso <- model_code(sso, my_code)
cat(model_code(sso))

#############
### notes ###
#############

# view existing notes
notes(sso)

# add a note to the existing notes
sso <- notes(sso, "New note")
notes(sso)
cat(notes(sso))

# replace existing notes
sso <- notes(sso, "replacement note", replace = TRUE)
notes(sso)
 
##################
### model_name ###
##################

# view model name
model_name(sso)

# change model name
sso <- model_name(sso, "some other name")
identical(model_name(sso), "some other name")




