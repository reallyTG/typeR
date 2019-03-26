library(tacmagic)


### Name: batch_load
### Title: Load (+/- merge) ROIs for batch of participants
### Aliases: batch_load

### ** Examples

# For the working example, the participants are full filenames.
participants <- c(system.file("extdata", "AD06.tac", package="tacmagic"),
                  system.file("extdata", "AD07.tac", package="tacmagic"),
                  system.file("extdata", "AD08.tac", package="tacmagic"))

tacs <- batch_load(participants, tac_file_suffix="")



