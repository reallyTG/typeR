library(InferenceSMR)


### Name: est.expDeath
### Title: Estimation of the expected number of deaths.
### Aliases: est.expDeath

### ** Examples

#This example uses pre-built objects and shows the simple usage
#of the est.expDeath function when those objects already exists.
#For an example of how to built those object, refer to the 
#help page of the screening dataset.

data(req.objects);
cox.data = req.objects$cox.data;
#Remove "#" to run example :
#est.expDeath(req.objects$contribution,req.objects$incid,req.objects$cox,fuzz = 0.01, 
#req.objects$covnames);

#[1] 33.44264




