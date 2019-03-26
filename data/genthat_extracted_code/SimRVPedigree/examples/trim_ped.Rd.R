library(SimRVPedigree)


### Name: trim_ped
### Title: Trim pedigree based on proband recall
### Aliases: trim_ped

### ** Examples

#Read in example pedigree to trim
data(EgPeds)
egPeds <- new.ped(EgPeds)

#plot example_ped using kinship2
plot(subset(egPeds, FamID == 1), location = "topright", cex = 0.85)
mtext("Original Pedigree", side = 3, line = 2)


## Trim pedigree examples
# Illustrate the effect of various settings for recall_probs
Recall_Probabilities <- list(c(1),
                             c(1, 0.5),
                             c(1, 0.25, 0.1))


for (k in 1:length(Recall_Probabilities)) {
   set.seed(2)
   #trim pedigree
   TrimPed <- trim_ped(ped_file = subset(egPeds, FamID == 1),
                       recall_probs = Recall_Probabilities[[k]])

   plot(TrimPed, location = "topright", cex = 0.85)
   mtext(paste0("recall_probs = (", sep = "",
                paste(Recall_Probabilities[[k]], collapse = ", "), ')' ),
                side = 3, line = 2 )
}





