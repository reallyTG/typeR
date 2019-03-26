library(IRATER)


### Name: remake.dat
### Title: load and reparameterize an existing IRATE-model setup file
### Aliases: remake.dat

### ** Examples


# old.setup <- "JiangADCR" # select old IRATE setup to reparameterize 
# old.setup.path <- system.file(paste0("IRATE.examples/",old.setup,".dat"), package = "IRATER")

# new.setup <- new.setup.path <- "JiangAICR_manual"
# system(paste("mkdir -p ",new.setup.path)) # create run folder for new setup
# system(paste("cp",old.setup.path, new.setup.path)) # copy old setup in new run folder

# setwd(new.setup.path)
# remake.dat(old.setup,new.setup,age.dependent = F) # reparameterize old setup
# run.IRATE(setup.new) # run new setup




