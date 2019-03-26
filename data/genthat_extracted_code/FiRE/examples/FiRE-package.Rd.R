library(FiRE)


### Name: FiRE-package
### Title: Finder of Rare Entities (FiRE) - To assign rareness/ outlierness
###   score to every sample
### Aliases: FiRE Rcpp_FiRE
### Keywords: Finder of Rare Entities, Rare, Rare cells, Rare events,
###   Hashing, Outlier detection, Anomaly detection

### ** Examples


     ## L <- number of estimators
     ## M <- Number of dims to sample
     ## H <- Number of bins
     ## seed <- seed for random number generator
     ## verbose <- verbose level

     library('FiRE')
     data(sample_data) #Samples * Features

     data(sample_label)
     ## Samples with label '1' represent abundant,
     ## while samples with label '2' represent rare.

     ## Saving rownames and colnames
     rnames <- rownames(sample_data)
     cnames <- colnames(sample_data)

     ## Converting data.frame to matrix
     sample_data <- as.matrix(sample_data)
     sample_label <- as.matrix(sample_label)

     L <- 100 # Number of estimators
     M <- 50 # Dims to be sampled

     # Model creation without optional parameter
     model <- new(FiRE::FiRE, L, M)

     ## There are 3 more optional parameters they can be passed as
     ## model <- new(FiRE::FiRE, L, M, H, seed, verbose)

     ## Hashing all samples
     model$fit(sample_data)

     ## Computing score of each sample
     rareness_score <- model$score(sample_data)

     ## Apply IQR-based criteria to identify rare samples for further downstream analysis.
     q3 <- quantile(rareness_score, 0.75)
     iqr <- IQR(rareness_score)
     th <- q3 + (1.5*iqr)

     ## Select indexes that satisfy IQR-based thresholding criteria.
     indIqr <- which(rareness_score >= th)

     ## Create a vector for binary predictions
     predictions <- rep(1, dim(sample_data)[1])
     predictions[indIqr] <- 2 #Replace predictions for rare samples with '2'.

     ## To access model parameters
     ## Parameters - generated weights
     # model$w

     ## Parameters - sample dimensions
     # model$d

     ## Parameters - generated thresholds
     # model$ths

     ## Parameters - Bins
     # model$b



