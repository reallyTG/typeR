library(Bios2cor)


### Name: create_boxplot
### Title: Creates boxplot file
### Aliases: create_boxplot
### Keywords: boxplot correlation

### ** Examples


msf <- system.file("msa/toy_align.msf", package = "Bios2cor")
  align <- import.msf(msf)

  #Creating OMES object
  omes <- omes(align,fileHelix= NULL , diag= 0, fileCSV= NULL, gap_val= 0.8, z_score= TRUE)
  omes <-omes$normalized

  #Creating list for boxplots
    corr_objects <- list(omes)
    corr_objects_names <- c("omes")
    create_boxplot(corr_objects, corr_objects_names, 25, 275,"boxplot.png")



