## ----eval=FALSE----------------------------------------------------------
#  install.packages("preText")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("matthewjdenny/preText")

## ----eval=FALSE----------------------------------------------------------
#  library(preText)

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
library(preText)
library(quanteda)

# load in U.S. presidential inaugural speeches from Quanteda example data.
documents <- data_corpus_inaugural
# use first 10 documents for example
documents <- documents[1:10,]
# take a look at the document names
print(names(documents))

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
preprocessed_documents <- factorial_preprocessing(
    documents,
    use_ngrams = FALSE,
    infrequent_term_threshold = 0.2,
    verbose = FALSE)

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
names(preprocessed_documents)
head(preprocessed_documents$choices)

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
preText_results <- preText(
    preprocessed_documents,
    dataset_name = "Inaugural Speeches",
    distance_method = "cosine",
    num_comparisons = 20,
    verbose = FALSE)

## ----eval=TRUE, fig.width=6, fig.height=16, fig.align ='center'----------
preText_score_plot(preText_results)

## ----eval=TRUE, fig.width=6, fig.height=4, fig.align ='center'-----------
regression_coefficient_plot(preText_results,
                            remove_intercept = TRUE)

## ----eval=FALSE, fig.width=6, fig.height=4, fig.align ='center'----------
#  # load the package
#  library(preText)
#  # load in the data
#  data("UK_Manifestos")
#  # preprocess data
#  preprocessed_documents <- factorial_preprocessing(
#      UK_Manifestos,
#      use_ngrams = TRUE,
#      infrequent_term_threshold = 0.02,
#      verbose = TRUE)
#  # run preText
#  preText_results <- preText(
#      preprocessed_documents,
#      dataset_name = "UK Manifestos",
#      distance_method = "cosine",
#      num_comparisons = 100,
#      verbose = TRUE)
#  # generate preText score plot
#  preText_score_plot(preText_results)
#  # generate regression results
#  regression_coefficient_plot(preText_results,
#                              remove_intercept = TRUE)

