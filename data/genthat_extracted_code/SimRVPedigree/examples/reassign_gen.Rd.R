library(SimRVPedigree)


### Name: reassign_gen
### Title: Reassign generation number based on affected status
### Aliases: reassign_gen

### ** Examples

# Read in example pedigrees
data(EgPeds)
class(EgPeds)

# Create ped object
Bpeds <- new.ped(EgPeds)
summary(Bpeds)

# Reassign generation numbers in the first four pedigrees in EgPeds
Apeds <- lapply(seq_len(5), function(x){
                 reassign_gen(Bpeds[Bpeds$FamID == x, ])})
Apeds <- do.call(rbind, Apeds)

# Compare pedigrees before and after reassigning
# generation number based on affected status
par(mfrow = c(1, 2))
for (k in 1:5) {
  plot(subset(Bpeds, FamID == k), gen_lab = TRUE, plot_legend = FALSE)
  mtext(paste0("Ped", k, ": before generation reassignment", sep = ""),
        side = 3, line = 1.5)

  plot(subset(Apeds, FamID == k), gen_lab = TRUE, plot_legend = FALSE)
  mtext(paste0("Ped", k, ": after generation reassignment", sep = ""),
        side = 3, line = 1.5)
}
par(mfrow = c(1, 1))



