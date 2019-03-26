library(plink)


### Name: plink-methods
### Title: Separate Calibration
### Aliases: plink plink-methods plink,list,matrix-method
###   plink,list,data.frame-method plink,list,list-method
###   plink,irt.pars,ANY-method
### Keywords: methods

### ** Examples

###### Unidimensional Examples ######
# Create irt.pars object with two groups (all dichotomous items),
# rescale the item parameters using the Mean/Sigma linking constants,
# and exclude item 27 from the common item set
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, cat=list(rep(2,36),rep(2,36)), 
  poly.mod=list(pm,pm))
out <- plink(x, rescale="MS", base.grp=2, D=1.7, exclude=list(27,NA))
summary(out, descrip=TRUE)
pars.out <- link.pars(out)


# Create object with six groups (all dichotomous items)
pars <- TK07$pars
common <- TK07$common
cat <- list(rep(2,26),rep(2,34),rep(2,37),rep(2,40),rep(2,41),rep(2,43))
pm1 <- as.poly.mod(26)
pm2 <- as.poly.mod(34)
pm3 <- as.poly.mod(37)
pm4 <- as.poly.mod(40)
pm5 <- as.poly.mod(41)
pm6 <- as.poly.mod(43)
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
x <- as.irt.pars(pars, common, cat, pm, 
  grp.names=paste("grade",3:8,sep=""))
out <- plink(x)
summary(out)
constants <- link.con(out) # Extract linking constants

# Create an irt.pars object and a sep.pars object for two groups of
# nominal response model items. Compare non-symmetric and symmetric 
# minimization. Note: This example may take a minute or two to run
## Not run: 
##D pm <- as.poly.mod(60, "nrm", 1:60)
##D pars1 <- as.irt.pars(act.nrm$yr97, cat=rep(5,60), poly.mod=pm)
##D pars2 <- sep.pars(act.nrm$yr98, cat=rep(5,60), poly.mod=pm)
##D out <- plink(list(pars1, pars2), matrix(1:60,60,2))
##D out1 <- plink(list(pars1, pars2), matrix(1:60,60,2), symmetric=TRUE)
##D summary(out, descrip=TRUE)
##D summary(out1, descrip=TRUE)
## End(Not run)

# Compute linking constants for two groups with multiple-choice model
# item parameters. Rescale theta values and item parameters using
# the Haebara linking constants
# Note: This example may take a minute or two to run
## Not run: 
##D theta <- rnorm(100) # In practice, estimated theta values would be used
##D pm <- as.poly.mod(60, "mcm", 1:60)
##D x <- as.irt.pars(act.mcm, common=matrix(1:60,60,2), cat=list(rep(6,60),
##D   rep(6,60)), poly.mod=list(pm,pm))
##D out <- plink(x, ability=list(theta,theta), rescale="HB")
##D pars.out <- link.pars(out)
##D ability.out <- link.ability(out)
##D summary(out, descrip=TRUE)
## End(Not run)

# Compute linking constants for two groups using mixed-format items and 
# a mixed placement of common items. Compare calibrations with the
# inclusion or exclusion of NRM items. This example uses the dgn dataset.
pm1 <- as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group1)
pm2 <- as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group2)
x <- as.irt.pars(dgn$pars,dgn$common,dgn$cat,list(pm1,pm2))
# Run with the NRM common items included
out <- plink(x) 
# Run with the NRM common items excluded
out1 <- plink(x,exclude="nrm") 
summary(out)
summary(out1)


# Compute linking constants for six groups using mixed-format items and 
# a mixed placement of common items. This example uses the reading dataset.
# See the information on the dataset for an interpretation of the output.
pm1 <- as.poly.mod(41, c("drm", "gpcm"), reading$items[[1]])
pm2 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[2]])
pm3 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[3]])
pm4 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[4]])
pm5 <- as.poly.mod(72, c("drm", "gpcm"), reading$items[[5]])
pm6 <- as.poly.mod(71, c("drm", "gpcm"), reading$items[[6]])
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
x <- as.irt.pars(reading$pars, reading$common, reading$cat, pm, base.grp=4)
out <- plink(x)
summary(out)


###### Multidimensional Examples ######
# Reckase Chapter 9
pm <- as.poly.mod(80, "drm", list(1:80))
x <- as.irt.pars(reckase9$pars, reckase9$common, 
  list(rep(2,80),rep(2,80)), list(pm,pm), dimensions=2)
# Compute constants using the least squares method and 
# the orthongal rotation with variable dilation. 
# Rescale the item parameters using the LS method
out <- plink(x, dilation="orth.vd", rescale="LS")
summary(out, descrip=TRUE)
# Extract the rescaled item parameters
pars.out <- link.pars(out)

# Compute constants using an oblique Procrustes method
# Display output and descriptives
out <- plink(x, dilation="oblique")
summary(out, descrip=TRUE)

# Compute constants using and orthogonal rotation with
# a fixed dilation parameter 
# Rescale the item parameters and ability estimates 
# using the "HB" and "LS" methods.
# Display the optimization iterations
ability <- matrix(rnorm(40),20,2)
out <- plink(x, method=c("HB","LS"), dilation="orth.fd", 
   rescale="HB", ability=list(ability,ability),
   control=list(trace=1,rel.tol=0.001))
summary(out)
# Extract rescaled ability estimates
ability.out <- out$ability


# Compute linking constants for two groups using mixed-format items 
# modeled with the M3PL and MGPCM. Only compute constants using the 
# orth.vd dilation.
pm <- as.poly.mod(60,c("drm","gpcm"), list(c(1:60)[md.mixed$cat==2],
  c(1:60)[md.mixed$cat>2]))
x <- as.irt.pars(md.mixed$pars, matrix(1:60,60,2), 
  list(md.mixed$cat, md.mixed$cat), 
  list(pm, pm), dimensions=4, grp.names=c("Form.X","Form.Y"))
out <- plink(x,dilation="orth.vd")
summary(out, descrip=TRUE)


# Illustration of construct shift and how to specify common dimensions
pm <- as.poly.mod(80, "drm", list(1:80))
pars <- cbind(round(runif(80),2),reckase9$pars[[1]])
x <- as.irt.pars(list(pars,reckase9$pars[[2]]), reckase9$common, 
list(rep(2,80),rep(2,80)), list(pm,pm), dimensions=c(3,2))
dim.order <- matrix(c(1,2,3,NA,1,2),2,3,byrow=TRUE)
out <- plink(x, dilation="oblique", dim.order=dim.order, rescale="LS")
summary(out)
pars.out <- link.pars(out)




