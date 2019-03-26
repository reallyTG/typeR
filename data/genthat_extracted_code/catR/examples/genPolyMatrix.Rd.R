library(catR)


### Name: genPolyMatrix
### Title: Item bank generation (polytomous models)
### Aliases: genPolyMatrix

### ** Examples


# All generated item banks have 10 items and at most four response categories

 # GRM 
 genPolyMatrix(10, 4, model = "GRM")

 # GRM with same number of response categories
 genPolyMatrix(10, 4, model = "GRM", same.nrCat = TRUE)

 # MGRM 
 genPolyMatrix(10, 4, model = "MGRM")

 # MGRM with same number of response categories
 genPolyMatrix(10, 4, model = "MGRM", same.nrCat = TRUE) # same result

 # PCM 
 genPolyMatrix(10, 4, model = "PCM")

 # PCM with same number of response categories
 genPolyMatrix(10, 4, model = "PCM", same.nrCat = TRUE) 

 # GPCM 
 genPolyMatrix(10, 4, model = "GPCM")

 # GPCM with same number of response categories
 genPolyMatrix(10, 4, model = "GPCM", same.nrCat = TRUE) 

 # RSM 
 genPolyMatrix(10, 4, model = "RSM")

 # RSM with same number of response categories
 genPolyMatrix(10, 4, model = "RSM", same.nrCat = TRUE) # same result

 # NRM 
 genPolyMatrix(10, 4, model = "NRM")

 # NRM with same number of response categories
 genPolyMatrix(10, 4, model = "NRM", same.nrCat = TRUE)  

## Content balancing

 # Creation of the 'cbList' list with arbitrary proportions
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # NRM with 100 items
 genPolyMatrix(100, 4, model = "NRM", cbControl = cbList)
 


