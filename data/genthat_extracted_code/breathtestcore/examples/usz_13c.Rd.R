library(breathtestcore)


### Name: usz_13c
### Title: Zurich sample set of 13C breath test data
### Aliases: usz_13c
### Keywords: datasets

### ** Examples

data(usz_13c)
## Not run: 
##D str(usz_13c)
##D # Plot all records; this needs some time
##D pdf(file.path(tempdir(), "usz_13c.pdf"), height= 30)
##D # null_fit makes data plotable without fitting a model
##D plot(null_fit(usz_13c))
##D dev.off()
## End(Not run)
# Plot a subset
suppressPackageStartupMessages(library(dplyr))
usz_part =  usz_13c  %>% 
  filter(patient_id %in% c("norm_001","norm_002", "pat_001", "pat_002"))
plot(null_fit(usz_part))



