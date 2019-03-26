library(nadiv)


### Name: makeAinv
### Title: Creates the inverse additive genetic relationship matrix
### Aliases: makeAinv makeAinv.default makeAinv.fuzzy makeAinv.default
###   makeAinv.fuzzy

### ** Examples


 ##  Without genetic groups  ##
 makeAinv(Mrode2)
 
 ##  With genetic groups  ##
  ## Type A
   typeAped <- Q1988[-c(3:7), c("id", "damGG", "sireGG")]
   AstarA <- makeAinv(typeAped, ggroups = 2, gOnTop = FALSE)$Ainv
  ## Type D
   typeDped <- Q1988[-c(1:7), c("id", "damGG", "sireGG")]
   AstarD <- makeAinv(typeDped, ggroups = c("g1", "g2"), gOnTop = FALSE)$Ainv
  stopifnot(identical(AstarA, AstarD))
  
  # Show that the augmented A-inverse with genetic groups
  # contains the normal A-inverse (i.e., without genetic groups)
   ## Augmented A-inverse with genetic groups
    ggAinv <- makeAinv(Mrode3[-c(1,2), c("calf", "damGG", "sireGG")],
	ggroups = c("g1", "g2"), gOnTop = FALSE)$Ainv
    noggAinv <- makeAinv(Mrode3[-c(1,2), c("calf", "dam", "sire")],
	ggroups = NULL)$Ainv
    # First 8 rows & columns of ggAinv are same as A-inverse without 
    ## genetic groups
    ggAinv[1:8, 1:8]
    noggAinv
   stopifnot(all.equal(ggAinv[1:8, 1:8], noggAinv))
   
 ##  With fuzzy classification of genetic groups  ##
  ## example in Fikse (2009)
  Fped <- F2009[-c(1:3), c("id", "phantomDam", "phantomSire")]
    Fped$id <- factor(Fped$id, levels = as.character(unique(Fped$id)))
  Ffuzz <- as.matrix(F2009[4:10, c("g1", "g2", "g3")])
    dimnames(Ffuzz)[[1]] <- as.character(F2009[4:10, 1])
  AstarF <- makeAinv(Fped, fuzz = Ffuzz, gOnTop = FALSE)$Ainv

  ## Show that A-inverse with fuzzy classification of genetic groups
  ### can be the same as genetic group A-inverse without fuzzy classification
  ### Create a 'null' fuzzy classification matrix for Q1988 pedigree
  QfuzzNull <- matrix(c(1,0,0,1,0, 0,1,1,0,1), nrow = 5, ncol = 2,
	dimnames = list(letters[1:5], c("g1", "g2")))
  typeFped <- Q1988[-c(1:2), c("id", "phantomDam", "phantomSire")]
  AstarNullFuzzy <- makeAinv(typeFped, fuzz = QfuzzNull, gOnTop = FALSE)$Ainv
  # Same as above using either pedigree type 'A' or 'D'
  stopifnot(identical(AstarNullFuzzy, AstarA),
	identical(AstarNullFuzzy, AstarD))





