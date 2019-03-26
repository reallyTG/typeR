library(IRATER)


### Name: clean.admb
### Title: delete IRATE (ADMB) run files
### Aliases: clean.admb clean.IRATE

### ** Examples

example.setup <- IRATE.examples()
new.setup <- new.setup.path <- example.setup[1] # select old IRATE setup to reparameterize
print(new.setup) # print setup name to be run
old.setup.path <- system.file(paste0("IRATE.examples/",new.setup,".dat"), package = "IRATER")

system(paste("mkdir -p ",new.setup.path)) # create run folder for new setup
system(paste("cp",old.setup.path, new.setup.path)) # copy old setup in new run folder
setwd(new.setup.path)

run.IRATE(new.setup) # compile and run setup
clean.IRATE(new.setup) # deletes run files (leaving only the setup file for reruns)



