library(tacmagic)


### Name: batch_tm
### Title: Calculate one or more models for a batch of participants
### Aliases: batch_tm

### ** Examples

participants <- c(system.file("extdata", "AD06.tac", package="tacmagic"),
                  system.file("extdata", "AD07.tac", package="tacmagic"),
                  system.file("extdata", "AD08.tac", package="tacmagic"))

tacs <- batch_load(participants, tac_file_suffix="")

# Keeps only the ROIs without partial-volume correction (PMOD convention)
tacs <- lapply(tacs, split_pvc, FALSE)

batch <- batch_tm(tacs, models=c("SUVR", "Logan"), ref="Cerebellum_r",
                  SUVR_def=c(3000,3300,3600), k2prime=0.2, t_star=23)




