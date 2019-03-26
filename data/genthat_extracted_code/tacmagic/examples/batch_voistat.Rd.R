library(tacmagic)


### Name: batch_voistat
### Title: Obtain values from voistat files (using load_voistat() for a
###   batch.
### Aliases: batch_voistat

### ** Examples

participants <- c(system.file("extdata", "AD06_BPnd_BPnd_Logan.voistat", 
                              package="tacmagic"),
                   system.file("extdata", "AD07_BPnd_BPnd_Logan.voistat", 
                               package="tacmagic"),
                   system.file("extdata", "AD08_BPnd_BPnd_Logan.voistat", 
                               package="tacmagic"))

batchtest <- batch_voistat(participants=participants, ROI_def=roi_ham_pib(), 
                           dir="", filesuffix="", varname="Logan") 




