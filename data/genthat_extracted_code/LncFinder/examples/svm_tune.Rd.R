library(LncFinder)


### Name: svm_tune
### Title: Parameter Tuning of SVM
### Aliases: svm_tune

### ** Examples

## Not run: 
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D positive_data <- extract_features(Seqs[1:5], label = "NonCoding",
##D                                   SS.features = FALSE, format = "DNA",
##D                                   frequencies.file = "human",
##D                                   parallel.cores = 2)
##D 
##D negative_data <- extract_features(Seqs[6:10], label = "Coding",
##D                                   SS.features = FALSE, format = "DNA",
##D                                   frequencies.file = "human",
##D                                   parallel.cores = 2)
##D 
##D my_dataset <- rbind(positive_data, negative_data)
##D 
##D ### Or use our data "demo_dataset"
##D data(demo_dataset)
##D my_dataset <- demo_dataset
##D 
##D optimal_parameter <- svm_tune(my_dataset, positive.class = "NonCoding",
##D                               folds.num = 2, seed = 1,
##D                               gamma.range = (2 ^ seq(-5, 0, 2)),
##D                               cost.range = c(1, 8, 16),
##D                               return.model = FALSE, parallel.core = 2)
##D 
##D ### Users can set return.model = TRUE to return the best model.
## End(Not run)



