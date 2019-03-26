## ------------------------------------------------------------------------
library(MASS)
library(lime)
data(biopsy)

# First we'll clean up the data a bit
biopsy$ID <- NULL
biopsy <- na.omit(biopsy)
names(biopsy) <- c('clump thickness', 'uniformity of cell size', 
                   'uniformity of cell shape', 'marginal adhesion',
                   'single epithelial cell size', 'bare nuclei', 
                   'bland chromatin', 'normal nucleoli', 'mitoses',
                   'class')

# Now we'll fit a linear discriminant model on all but 4 cases
set.seed(4)
test_set <- sample(seq_len(nrow(biopsy)), 4)
prediction <- biopsy$class
biopsy$class <- NULL
model <- lda(biopsy[-test_set, ], prediction[-test_set])

## ------------------------------------------------------------------------
predict(model, biopsy[test_set, ])

## ------------------------------------------------------------------------
explainer <- lime(biopsy[-test_set,], model, bin_continuous = TRUE, quantile_bins = FALSE)
explanation <- explain(biopsy[test_set, ], explainer, n_labels = 1, n_features = 4)
# Only showing part of output for better printing
explanation[, 2:9]

## ---- fig.asp=1.25, out.width='70%', fig.width=6, fig.align='center'-----
plot_features(explanation, ncol = 1)

## ------------------------------------------------------------------------
library(lime)
library(xgboost) # the classifier
library(text2vec) # used to build the BoW matrix

# load data
data(train_sentences)
data(test_sentences)

# Data are stored in a 2 columns data.frame, one for the sentences, one for the 
# labels.
print(str(train_sentences))

# The list of possible classes for a sentence
# We are only interested in the class "OWNX"
print(unique(train_sentences$class.text))

# Tokenize data
get_matrix <- function(text) {
  it <- itoken(text, progressbar = FALSE)
  create_dtm(it, vectorizer = hash_vectorizer())
}

# BoW matrix generation
dtm_train = get_matrix(train_sentences$text)
dtm_test = get_matrix(test_sentences$text)

# Create boosting model for binary classification (-> logistic loss)
# Other parameters are quite standard
param <- list(max_depth = 7, 
              eta = 0.1, 
              objective = "binary:logistic", 
              eval_metric = "error", 
              nthread = 1)

xgb_model <- xgb.train(
  param, 
  xgb.DMatrix(dtm_train, label = train_sentences$class.text == "OWNX"),
  nrounds = 50
)

## ------------------------------------------------------------------------
# We use a (standard) threshold of 0.5
predictions <- predict(xgb_model, dtm_test) > 0.5
test_labels <- test_sentences$class.text == "OWNX"

# Accuracy
print(mean(predictions == test_labels))

## ---- fig.asp=1, out.width='70%', fig.width=6, fig.align='center'--------
# We select 10 sentences from the label OWNX
sentence_to_explain <- head(test_sentences[test_labels,]$text, 5)
explainer <- lime(sentence_to_explain, model = xgb_model, 
                  preprocess = get_matrix)
explanation <- explain(sentence_to_explain, explainer, n_labels = 1, 
                       n_features = 2)

# Most of the words choosen by Lime
# are related to the team (we, our)
# or part of the paper (Section, in)
explanation[, 2:9]

# Another more graphical view of the same information (2 first sentences only)
plot_features(explanation)

## ------------------------------------------------------------------------
plot_text_explanations(explanation)

## ----eval=FALSE----------------------------------------------------------
#  # Launching the application is done in one command
#  interactive_text_explanations(explainer)

## ---- echo=FALSE---------------------------------------------------------
devtools::session_info()

