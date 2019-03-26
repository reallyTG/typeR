## ---- eval=FALSE---------------------------------------------------------
#  library(nmfem)

## ---- eval = FALSE-------------------------------------------------------
#  ID <- travelers[ ,1]
#  travelers <- travelers[ ,-1]

## ---- eval = FALSE-------------------------------------------------------
#  nmfem_mult_modelselection(travelers, save = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  K = 10
#  H = 5
#  
#  load(file = paste0("Matrices/Matrices_H",H,"_K",K,".RData"))

## ----eval=FALSE----------------------------------------------------------
#  
#  profiles <- as.data.frame(t(Theta %*% Lambda))
#  
#  display_profile(profiles[1, ], language = "en")
#  display_profile(profiles[2, ], language = "en")
#  display_profile(profiles[3, ], language = "en")
#  display_profile(profiles[4, ], language = "en")
#  display_profile(profiles[5, ], language = "en")
#  display_profile(profiles[6, ], language = "en")
#  display_profile(profiles[7, ], language = "en")
#  display_profile(profiles[8, ], language = "en")
#  display_profile(profiles[9, ], language = "en")
#  display_profile(profiles[10, ], language = "en")
#  
#  display_profile(t(Theta[ ,1]), color = "Purples", language = "en")
#  display_profile(t(Theta[ ,2]), color = "PuRd", language = "en")
#  display_profile(t(Theta[ ,3]), color = "Oranges", language = "en")
#  display_profile(t(Theta[ ,4]), color = "Reds", language = "en")
#  display_profile(t(Theta[ ,5]), color = "Greens", language = "en")

