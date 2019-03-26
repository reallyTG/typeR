library(textmineR)


### Name: FitCtmModel
### Title: Fit a Correlated Topic Model
### Aliases: FitCtmModel

### ** Examples

# Load a pre-formatted dtm 
data(nih_sample_dtm) 

# Fit a CTM model on a sample of documents
model <- FitCtmModel(dtm = nih_sample_dtm[ sample(1:nrow(nih_sample_dtm) , 10) , ], 
                     k = 3, return_all = FALSE)



